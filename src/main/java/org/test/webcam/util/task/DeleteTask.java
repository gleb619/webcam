package org.test.webcam.util.task;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.joda.time.DateTime;
import org.joda.time.LocalDate;
import org.test.webcam.model.domain.entity.Photo;
import org.test.webcam.model.service.PhotoService;

public class DeleteTask implements Task {

	private PhotoService photoService;

	public DeleteTask(PhotoService photoService) {
		super();
		this.photoService = photoService;
		System.out.println("DeleteTask.DeleteTask()");
	}

	@Override
	public void run() {
		System.out.println("DeleteTask.run()");
		init();
	}

	@Override
	public DeleteTask init() {
		System.out.println("DeleteTask.init()");
		List<Photo> oldPhotos = new ArrayList<Photo>();
		try {
			Photo example = new Photo();
			
			example.setCreateon(new LocalDate(new Date()).minusDays(3).toDate());
			
			oldPhotos = photoService.findByExample2(example, DateCompare.LESS);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("DeleteTask.init()#oldPhotos: " + oldPhotos.size());
		
		return this;
	}

	@Override
	public DeleteTask start() {
		System.out.println("DeleteTask.start()");
		new Thread(this).start();
		
		return this;
	}

	
}
