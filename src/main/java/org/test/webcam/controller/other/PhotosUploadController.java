/*
 * 
 */
package org.test.webcam.controller.other;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.security.Principal;
import java.util.Map;
import java.util.UUID;

import javax.imageio.IIOException;
import javax.imageio.ImageIO;
import javax.servlet.ServletContext;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.test.webcam.controller.data.types.JsonOutput;
import org.test.webcam.model.domain.entity.Photo;
import org.test.webcam.model.domain.entity.secure.SasUser;
import org.test.webcam.model.service.PhotoService;
import org.test.webcam.model.service.secure.RestAuthentication;
import org.test.webcam.util.FileUtils;
import org.test.webcam.util.SObjectListner;
import org.test.webcam.util.data.types.FilesSettings;

// TODO: Auto-generated Javadoc
/**
 * The Class DocumentsController.
 */
@Controller
public class PhotosUploadController {

	/** The files settings. */
	@Autowired
	private FilesSettings filesSettings;
	
	/** The servlet context. */
	@Autowired
	private ServletContext servletContext;
	
	/** The s object listner. */
	@Autowired
	private SObjectListner sObjectListner;
	
	@Autowired
	private RestAuthentication restAuthentication;
	
	@Autowired
	private PhotoService photoService;
	
	/** The debug. */
	private Boolean debug = true;
	
	/*
	@RequestMapping(value = "/documents/{id}.{extension}" , method = RequestMethod.GET, produces = MediaType.ALL_VALUE)
	@ResponseBody
	public BufferedImage loadImage(
			  @PathVariable String id
			, @PathVariable String extension
			, @RequestParam(value = "path", required = false) String path
			, @RequestParam(value = "height", required = false) Integer height
			, @RequestParam(value = "width", required = false) Integer width
			, @RequestParam(value = "size", required = false) Integer size
			) {
		
		BufferedImage image = null;
		
		try {
			if (path == null) {
				path = documentsettings.getDefaultPath();
			}
			
			File imageFile = new File(path + "/" + id + "." + extension);
			if (debug) {
				System.out.println(
						"id: " + id +
						", extension: " + extension +
						", path: " + imageFile.getAbsolutePath()
				);
			}
			
			try {
				image = ImageIO.read(imageFile);
			} catch (IIOException e) {
				System.err.println("ERROR: " + " file: " + imageFile.getAbsolutePath() + ", " + e.getLocalizedMessage());
				image = notFound();
			}
			
			if (size != null) {
				height = size;
				width = size;
			}
			
			if (height != null && width != null) {
				image = Scalr.resize(image, Scalr.Method.BALANCED, width, height);
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}

		return image;
	}
	
	@SuppressWarnings("unused")
	private BufferedImage loadPng(File imageFile) throws IOException {
		BufferedImage in = ImageIO.read(imageFile);
		BufferedImage newImage = new BufferedImage(in.getWidth(), in.getHeight(), BufferedImage.TYPE_INT_ARGB);
		Graphics2D g = newImage.createGraphics();
		g.drawImage(in, 0, 0, null);
		g.dispose();
		
		return newImage;
	}
	
	private BufferedImage loadPng(InputStream imageFile) throws IOException {
		BufferedImage in = ImageIO.read(imageFile);
		BufferedImage newImage = new BufferedImage(in.getWidth(), in.getHeight(), BufferedImage.TYPE_INT_ARGB);
		Graphics2D g = newImage.createGraphics();
		g.drawImage(in, 0, 0, null);
		g.dispose();
		
		return newImage;
	}
	
	@RequestMapping(value = "/documents/"
			, produces = { "image/jpeg", "image/jpg", "image/png", "image/gif" }
			, method = RequestMethod.GET)
	@ResponseBody
	public BufferedImage notFound() {
		try {
//			String imageFileName = "/resources/documents/wait.png";
			String imageFileName = "/resources/documents/wait2.png";
			InputStream imageFile = servletContext.getResourceAsStream(imageFileName);
			BufferedImage image = loadPng(imageFile); 
//			BufferedImage image = ImageIO.read(imageFile); 
			
			return image;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
	 */
	/**
	 * Upload image.
	 *
	 * @param file the file
	 * @param principal the principal
	 * @return the map< string,? extends object>
	 */
	@RequestMapping(value = "/api/{key}/photo/upload", method = RequestMethod.POST)
	@PreAuthorize(value = "hasPermission(#key, 'photo')")
	public @ResponseBody Map<String, ? extends Object> uploadPhoto(@PathVariable String key, @RequestParam(value = "file", required = false) CommonsMultipartFile file
			, Principal principal) {
		System.out.println("PhotosUploadController.uploadPhoto()");

		if (file == null) {
			return JsonOutput.mapError( "File is NULL");
		}
		else if (!file.isEmpty()) {
			SasUser sasUser = restAuthentication.readSasUser(key);
			if (debug) {
				System.out.println(
						"file: " + file + 
						", name: " + file.getName() +
						", contentType: " + file.getContentType() +
						", originalFilename: " + file.getOriginalFilename() +
						", extension: " + FilenameUtils.getExtension(file.getOriginalFilename()) +
						", size: " + file.getSize() +
						", defaultpath: " + filesSettings.getDocumentsDefaultPath()
				);
			}

			try {
				byte[] bytes = file.getBytes();
				
				Photo photo = dataLogic(sasUser, file);
				fileLogic(photo, bytes);
				
				return JsonOutput.mapSuccess();
			} catch (Exception e) {
				return JsonOutput.mapError( "Failed to upload " + file.getOriginalFilename() + " => " + e.getMessage() );
			}
		} else {
			return JsonOutput.mapError( "You failed to upload " + file.getOriginalFilename() + " because the file was empty." );
		}
	}
	
	private void fileLogic(Photo arg0, byte[] bytes) {
		File file = new File(arg0.getPath());
		
		Thread thread = new Thread(() -> {
			BufferedOutputStream stream = null;
		
			try {
				stream = new BufferedOutputStream( new FileOutputStream(file));
				stream.write(bytes);
				stream.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		});
		
		thread.start();
		
		if (debug) {
			System.out.println("image: " +
					file.getAbsolutePath()
			);
		}
	}
	
	
	private Photo dataLogic(SasUser sasUser, CommonsMultipartFile file) {
		Photo photo = new Photo();
		photo.setLabel(UUID.randomUUID().toString() + "." + FilenameUtils.getExtension(file.getOriginalFilename()));
		photo.setName(file.getOriginalFilename());
		photo.setPath(filesSettings.getPhotoDefaultPath() + "/" + photo.getLabel());
		
		photo = photoService.create(sObjectListner.create(sasUser, photo));
		
		return photo;
	}
	
}
