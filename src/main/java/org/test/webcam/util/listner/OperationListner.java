/*
 * 
 */
package org.test.webcam.util.listner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.test.webcam.controller.data.types.Operation;
import org.test.webcam.controller.data.types.OperationResult;
import org.test.webcam.model.domain.entity.secure.SasUser;

// TODO: Auto-generated Javadoc
/**
 * The Class OperationListner.
 */
@Component
public class OperationListner {
	
	/**
	 * Do operation.
	 *
	 * @param operation the operation
	 * @param sasUser the sas user
	 * @param clazz the clazz
	 * @return the operation result
	 */
	public OperationResult doOperation(Operation operation, SasUser sasUser, Class<?> clazz) {
		
		return null;
	}
	
}
