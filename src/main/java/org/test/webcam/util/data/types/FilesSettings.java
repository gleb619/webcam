/*
 * 
 */
package org.test.webcam.util.data.types;

import java.io.IOException;

import org.test.webcam.util.FileUtils;

// TODO: Auto-generated Javadoc
/**
 * The Class FilesSettings.
 */
public class FilesSettings {

	/** The image default path. */
	private String imageDefaultPath;

	/** The documents default path. */
	private String documentsDefaultPath;

	private String photoDefaultPath;

	/**
	 * Gets the image default path.
	 *
	 * @return the image default path
	 */
	public String getImageDefaultPath() {
		return imageDefaultPath;
	}

	/**
	 * Sets the image default path.
	 *
	 * @param imageDefaultPath
	 *            the new image default path
	 */
	public void setImageDefaultPath(String imageDefaultPath) {
		this.imageDefaultPath = imageDefaultPath;
	}

	/**
	 * Gets the documents default path.
	 *
	 * @return the documents default path
	 */
	public String getDocumentsDefaultPath() {
		return documentsDefaultPath;
	}

	/**
	 * Sets the documents default path.
	 *
	 * @param documentsDefaultPath
	 *            the new documents default path
	 */
	public void setDocumentsDefaultPath(String documentsDefaultPath) {
		this.documentsDefaultPath = documentsDefaultPath;
	}

	public String getPhotoDefaultPath() {
		return photoDefaultPath;
	}

	public void setPhotoDefaultPath(String photoDefaultPath) {
		this.photoDefaultPath = photoDefaultPath;
	}
	
	public FilesSettings check() throws IOException {
		FileUtils.createDirIfNotExist(imageDefaultPath);
		FileUtils.createDirIfNotExist(documentsDefaultPath);
		FileUtils.createDirIfNotExist(photoDefaultPath);
		
		return this;
	}

}
