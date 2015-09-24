/*
 * 
 */
package org.test.webcam.util;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.lang.reflect.Field;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.io.FilenameUtils;
import org.test.webcam.model.domain.SEntity;
import org.test.webcam.model.domain.SObject;
import org.test.webcam.util.converters.TxtToHtmlConverter;

// TODO: Auto-generated Javadoc
/**
 * The Class ConverterUtil.
 */
public class ConverterUtil {
	
	/**
	 * Text.
	 *
	 * @param path the path
	 * @return the string
	 */
	private static String text(String path) {
		String result = null;
		try {
			result = new String(Files.readAllBytes(Paths.get(path)), "UTF-8");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	/**
	 * Read entity.
	 *
	 * @param entity the entity
	 * @return the map
	 */
	public static Map<String, String> readEntity(Object entity) {
		Class<?> clazz = entity.getClass();
		Map<String, String> map = new HashMap<String, String>();
		
		for (Field field : readAllFields(new LinkedList<Field>(), clazz)) {
			field.setAccessible(true);
			try {
				Object value = field.get(entity);
				String textValue = "";
//				Object fieldType = field.getType();
				
				if (value instanceof List) {
					
				}
				else if (value == null){
					
				}
				else {
					if (value instanceof SEntity) {
						textValue = ((SEntity) value).getLabel();
					}
					else {
						textValue = value.toString();
					}
					
					map.put(field.getName().toLowerCase().replaceAll("\\s+", ""), textValue);
				}
				
			} catch (IllegalArgumentException | IllegalAccessException e) {
				e.printStackTrace();
			}
		}
		
		return map;
	}
	
	/**
	 * Read all fields.
	 *
	 * @param fields the fields
	 * @param type the type
	 * @return the list
	 */
	public static List<Field> readAllFields(List<Field> fields, Class<?> type) {
	    fields.addAll(Arrays.asList(type.getDeclaredFields()));

	    if (type.getSuperclass() != null) {
	        fields = readAllFields(fields, type.getSuperclass());
	    }

	    return fields;
	}
	
	/**
	 * Fill template.
	 *
	 * @param values the values
	 * @param templateText the template text
	 * @return the string
	 */
	public static String fillTemplate(Map<String, String> values, String templateText) {
//		System.out.println("ConverterUtil.fillTemplate()#templateText: " + templateText.length());
		List<String> varibles = readTemplate(templateText);
		
//		System.out.println("ConverterUtil.fillTemplate()#\n\nvaribles: " + varibles + "\n--------\n" + "values: " + values);
		
		templateText = variblesToLowerCase(templateText)
							.replaceAll("\\R<meta.*>", "")
							.replaceAll("\\R<META.*>", "")
							.replaceAll("\\R<meta.*>$", "")
							.replaceAll("\\R<META.*>$", "");
//	<META http-equiv="Content-Type" content="text/html; charset=UTF-8">
		
		for (String it : varibles) {
//			System.out.println("templateEngine#it: " + it + ", value: " + values.get(it));
			templateText = templateText.replaceAll("#" + it, values.getOrDefault(it, it));
		}
		
		return templateText;
	}
	
	/**
	 * Read template.
	 *
	 * @param template the template
	 * @return the list
	 */
	public static List<String> readTemplate(String template) {
		List<String> varibles = new ArrayList<String>();
//		^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3});$
		template = template.replaceAll("^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3});$", "%%HEX_COLOR$1");
		
		Pattern pattern = Pattern.compile("#(.*)\\s");
		Matcher matcher = pattern.matcher(template);
		
		while (matcher.find()) {
			varibles.add(matcher.group()
						.replaceAll("</span>", "")
						.replaceAll("\\s+", "")
						.replaceAll("#", "")
						.toLowerCase()
			);
		}
		
		return varibles;
	}
	
	/**
	 * Varibles to lower case.
	 *
	 * @param template the template
	 * @return the string
	 */
	public static String variblesToLowerCase(String template) {
		Pattern pattern = Pattern.compile("#(.*)\\s");
		Matcher matcher = pattern.matcher(template);
		
		while (matcher.find()) {
			template = template.replaceAll(matcher.group(), matcher.group().toLowerCase());
		}
		
		return template;
	}
	
}
