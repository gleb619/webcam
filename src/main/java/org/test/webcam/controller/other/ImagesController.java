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
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.test.webcam.controller.data.types.JsonOutput;
import org.test.webcam.model.domain.entity.secure.SasUser;
import org.test.webcam.util.SObjectListner;
import org.test.webcam.util.data.types.FilesSettings;


// TODO: Auto-generated Javadoc
/**
 * The Class ImagesController.
 */
@Controller
public class ImagesController {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 5863527129201614208L;

	/** The image settings. */
	@Autowired
	private FilesSettings imageSettings;
	
	/** The servlet context. */
	@Autowired
	private ServletContext servletContext;
	
	/** The s object listner. */
	@Autowired
	private SObjectListner sObjectListner;
	
	/** The debug. */
	private Boolean debug = false;
	
	
//	, headers = "Accept=image/jpeg, image/jpg, image/png, image/gif"
	/**
 * Load image.
 *
 * @param id the id
 * @param extension the extension
 * @param path the path
 * @param height the height
 * @param width the width
 * @param size the size
 * @return the buffered image
 */
@RequestMapping(value = "/images/{id}.{extension}"
			, method = RequestMethod.GET
			, produces = { "image/jpeg", "image/jpg", "image/png", "image/gif" }
//			, produces = "image/png"
//			, produces = MediaType.ALL_VALUE
	)
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
		
		if (id.startsWith("static_")) {
			String name = (id + "." + extension).replaceAll("static_", "");
			image = staticImage(name);
		}
		else {
			try {
				image = realImage(id, extension, path, height, width, size);
			} catch (IOException e) {
				System.err.println("ImagesController.loadImage()#ERROR: " + e.getMessage());
				return notFound();
			}
		}

		return image;
	}

	/**
	 * Static image.
	 *
	 * @param name the name
	 * @return the buffered image
	 */
	private BufferedImage staticImage(String name) {
		BufferedImage image = null;
		
		try {
			String imageFileName = "/resources/images/" + name;
			InputStream imageFile = servletContext.getResourceAsStream(imageFileName);
			image = ImageIO.read(imageFile);
//					loadPng(imageFile); 
			
		} catch (IOException e) {
			System.err.println("ImagesController.staticImage()#ERROR: " + e.getMessage());
		}
		
		return image;
	}

	/**
	 * Real image.
	 *
	 * @param id the id
	 * @param extension the extension
	 * @param path the path
	 * @param height the height
	 * @param width the width
	 * @param size the size
	 * @return the buffered image
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	private BufferedImage realImage(String id, String extension, String path,
			Integer height, Integer width, Integer size) throws IOException {
		BufferedImage image;
		if (path == null) {
//			path = imageSettings.getImageDefaultPath();
			path = imageSettings.getPhotoDefaultPath();
		}
		
		File imageFile = new File(path + "/" + id + "." + extension);
		if (debug) {
			System.out.println(
					"id: " + id +
					", extension: " + extension +
					", path: " + imageFile.getAbsolutePath()
			);
		}
		
		if (!imageFile.exists()) {
			throw new IOException("Cannot find file");
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
		/*
		if (height != null && width != null) {
			image = Scalr.resize(image, Scalr.Method.BALANCED, width, height);
		}
		*/
		return image;
	}
	
	
	
	/**
	 * Load png.
	 *
	 * @param imageFile the image file
	 * @return the buffered image
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	@SuppressWarnings("unused")
	private BufferedImage loadPng(File imageFile) throws IOException {
		BufferedImage in = ImageIO.read(imageFile);
		BufferedImage newImage = new BufferedImage(in.getWidth(), in.getHeight(), BufferedImage.TYPE_INT_ARGB);
		Graphics2D g = newImage.createGraphics();
		g.drawImage(in, 0, 0, null);
		g.dispose();
		
		return newImage;
	}
	
	/**
	 * Load png.
	 *
	 * @param imageFile the image file
	 * @return the buffered image
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	private BufferedImage loadPng(InputStream imageFile) throws IOException {
		BufferedImage in = ImageIO.read(imageFile);
		BufferedImage newImage = new BufferedImage(in.getWidth(), in.getHeight(), BufferedImage.TYPE_INT_ARGB);
		Graphics2D g = newImage.createGraphics();
		g.drawImage(in, 0, 0, null);
		g.dispose();
		
		return newImage;
	}
	
	/**
	 * Not found.
	 *
	 * @return the buffered image
	 */
	@RequestMapping(value = "/images/"
			, produces = { "image/jpeg", "image/jpg", "image/png", "image/gif" }
			, method = RequestMethod.GET)
	@ResponseBody
	public BufferedImage notFound() {
		return staticImage("wait.png");
	}


//	@ResponseBody Map<String, ? extends Object>
//	@ResponseBody String
	/**
 * Upload image.
 *
 * @param file the file
 * @param principal the principal
 * @return the map< string,? extends object>
 */
@RequestMapping(value = "/image/upload", method = RequestMethod.POST)
	public @ResponseBody Map<String, ? extends Object> uploadImage(@RequestParam("file") CommonsMultipartFile file
			, Principal principal) {
		
		SasUser sasUser = JsonOutput.readSasUser(principal);
		
		if (!file.isEmpty()) {
			
			if (debug) {
				System.out.println(
						"file: " + file + 
						", name: " + file.getName() +
						", contentType: " + file.getContentType() +
						", originalFilename: " + file.getOriginalFilename() +
						", extension: " + FilenameUtils.getExtension(file.getOriginalFilename()) +
						", size: " + file.getSize() +
						", defaultpath: " + imageSettings.getImageDefaultPath()
				);
			}

			try {
				byte[] bytes = file.getBytes();
				
//				------------------------------
				
				
				return 
						JsonOutput.mapSuccess();
//						"Successfully uploaded " + file.getOriginalFilename() + " into " + image.getName();
			} catch (Exception e) {
				return 
						JsonOutput.mapError(
								"Failed to upload " + file.getOriginalFilename() + " => " + e.getMessage()
						);
//								;
			}
		} else {
			return 
					JsonOutput.mapError(
					"You failed to upload " + file.getOriginalFilename()
					+ " because the file was empty."
					);
//					;
		}
	}
	/*
	*//**
	 * File logic.
	 *
	 * @param image the image
	 * @param bytes the bytes
	 *//*
	private void fileLogic(TmImage image, byte[] bytes) {
		File imageFile = new File(image.getPath());
		
		Thread thread = new Thread(() -> {
			BufferedOutputStream stream = null;
		
			try {
				stream = new BufferedOutputStream(
						new FileOutputStream(imageFile));
				stream.write(bytes);
				stream.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		});
		
		thread.start();
		
		if (debug) {
			System.out.println("image: " +
					imageFile.getAbsolutePath()
			);
		}
	}
	
	*//**
	 * Data logic.
	 *
	 * @param sasUser the sas user
	 * @param file the file
	 * @return the tm image
	 *//*
	private TmImage dataLogic(SasUser sasUser, CommonsMultipartFile file) {
		TmImage image = new TmImage();
		image.setName(UUID.randomUUID().toString());
		image.setContenttype(file.getContentType());
		image.setOriginalfilename(file.getOriginalFilename());
		image.setExtension(FilenameUtils.getExtension(file.getOriginalFilename()));
		image.setSize(new Long(file.getSize()).toString());
		image.setPath(imageSettings.getImageDefaultPath() + "/" + image.getName() + "." + image.getExtension());
		
		image = sObjectListner.create(sasUser, image);
		
		
		Thread thread = new Thread(() -> {
			try {
				checkForSentity(input, image);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			imageService.create(image);
		});
		
		thread.start();
		
		
		image = imageService.create(image);
		
		return image;
	}
*/
}
