/*
 * 
 */
package org.test.webcam.util;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.apache.commons.lang.StringUtils;
import org.test.webcam.controller.data.types.Parametr;
import org.test.webcam.controller.data.types.ScrollableSettings;
import org.test.webcam.model.domain.SObject;
import org.test.webcam.model.domain.SView;
import org.test.webcam.model.domain.entity.Photo;
import org.test.webcam.model.domain.entity.secure.SasUser;
import org.test.webcam.util.data.types.DateQuery;
import org.test.webcam.util.data.types.FindByDateExample;
import org.test.webcam.util.data.types.FindByExample;
import org.test.webcam.util.data.types.RangeDateQuery;
import org.test.webcam.util.data.types.SingleDateQuery;
import org.test.webcam.util.data.types.TotalQuery;
import org.test.webcam.util.task.DateCompare;

// TODO: Auto-generated Javadoc
/**
 * The Class DaoUtil.
 */
public class DaoUtil {

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
	 * Read type.
	 *
	 * @param value the value
	 * @param name the name
	 * @param owner the owner
	 * @return the string
	 */
	
	public static String readType(Object value, String name, String owner, DateCompare type) {
		String stringStatement = "%s.%s like :%s";
		String otherStatement = "%s.%s = :%s";
		if (value instanceof String) {
			return String.format(stringStatement, owner, name, name);
		}
		else if (value instanceof Date) {
			return String.format(type.value(), owner, name, name);
		}
		
		return String.format(otherStatement, owner, name, name);
	}
	
	@SuppressWarnings("unchecked")
	public static <T> T readValue(T value) {
		String stringStatement = "%%s%";
		if (value instanceof String) {
			return (T) String.format(stringStatement, value);
		}
		
		return value;
	}
	
	/**
	 * Read type.
	 *
	 * @param value the value
	 * @param name the name
	 * @param owner the owner
	 * @param parameterName the parameter name
	 * @return the string
	 */
	public static String readType(Object value, String name, String owner, String parameterName, DateCompare type) {
		String stringStatement = "%s.%s like :%s";
		String otherStatement = "%s.%s = :%s";
		
		if (value instanceof String) {
			return String.format(stringStatement, owner, name, parameterName);
		}
		else if (value instanceof Date) {
			return String.format(type.value(), owner, name, parameterName);
		} 
		
		return String.format(otherStatement, owner, name, name);
	}
	
	/**
	 * Creates the statement.
	 *
	 * @param statement the statement
	 * @param values the values
	 * @param clazz the clazz
	 * @param em the em
	 * @return the query
	 */
	public static Query createStatement(String statement, Map<String, Object> values, Class<?> clazz, EntityManager em) {
		Query query = em.createQuery(statement, clazz);
		
		for (String key : values.keySet()) {
			Object value = values.get(key);
			if (value instanceof String) {
				query.setParameter(key, "%" + value + "%");
			}
			else {
				query.setParameter(key, value);
			}
		}
		
		return query;
	}
	
	/**
	 * Find by example.
	 *
	 * @param <T> the generic type
	 * @param example the example
	 * @param clazz the clazz
	 * @param em the em
	 * @return the list
	 */
	@SuppressWarnings("unchecked")
	public static <T> List<T> findByExample(T example, Class<?> clazz, EntityManager em) {
		return (List<T>) findByExampleQuery(example, clazz, em);
	}
	
	/**
	 * Find by example query.
	 *
	 * @param example the example
	 * @param clazz the clazz
	 * @param em the em
	 * @return the query
	 */
	public static Query findByExampleQuery(Object example, Class<?> clazz, EntityManager em) {
		FindByExample selectClause = findByExampleQueryRaw(example, clazz, em);
		return createStatement(selectClause.getSelectClause(), selectClause.getValues(), clazz, em);
	}
	
	/**
	 * Read s object.
	 *
	 * @param example the example
	 * @param clazz the clazz
	 * @param shortName the short name
	 * @param owner the owner
	 * @return the map
	 */
	private static Map<String, Object> readSObject(Object example, Class<?> clazz, String shortName, String owner) {
		String[] except = {
				  "serialVersionUID"
				, "createon"
				, "modifyon"
		};
		
		Map<String, Object> output = new HashMap<String, Object>();
		Map<String, Object> values = new HashMap<String, Object>();
		List<String> statement = new ArrayList<String>();
		List<Field> fields = readAllFields(new LinkedList<Field>(), clazz);
		
		for (Field field : fields) {
			field.setAccessible(true);
			try {
				Object value = field.get(example);
				Object fieldType = field.getType();
				
				if (value != null) {
					if (value instanceof LinkedList || field.getType() == List.class || fieldType instanceof List) {
						System.err.println("List: " + field.getName());
					}
					else if (value instanceof SObject) {
						System.err.println("SObject");
					}
					else {
						System.out.println(
								"\t DaoUtil.readSObject()" + 
								"name: " + field.getName() + 
								"\n\t " + 
								"type: " + field.getType() +
								"\n\t" +
								" value: " + value.getClass() +
								"\n\t" +
								" fieldType: " + fieldType +
								"\n\t----------"
						);
						
						if (!Arrays.asList(except).contains(field.getName())) {
							values.put(owner + field.getName().toLowerCase(), value);
							statement.add(readType(value, field.getName().toLowerCase(), shortName + "." + owner, owner + field.getName().toLowerCase(), DateCompare.EQUALS));
						}
					}
				}
			} catch (IllegalArgumentException | IllegalAccessException e) {
				e.printStackTrace();
			}
		}
		
		output.put("values", values);
		output.put("statement", statement);
		
		return output;
	}
	
	public static FindByDateExample findByExample2(Object example, Class<?> clazz, EntityManager em, DateCompare type) {
		String[] except = {
				  "serialVersionUID"
				, "checked"
				, "sync"
		};
		
		Map<String, Object> values = new HashMap<String, Object>();
		List<String> statement = new ArrayList<String>();
		String shortName = clazz.getSimpleName().toLowerCase().substring(0, 3) + "0";
		String name = clazz.getSimpleName();
		
		String selectClause = "SELECT " + shortName + " FROM " + name + " " + shortName;
		readValues(example, clazz, except, values, statement, shortName, type);
		
		System.out.println("DaoUtil.findByExample2()#values: " + values.size() + ", statement: " + statement.size());
		
		if(statement.size() > 0){
			selectClause += " WHERE " + StringUtils.join(statement, null);
		}
		
		System.out.println("DaoUtil.findByExample2()#selectClause: " + selectClause);
		
		return new FindByDateExample(selectClause, values, em.createQuery(selectClause, clazz));
	}
	
	public static FindByExample findByExampleQueryRaw(Object example, Class<?> clazz, EntityManager em, String delimitter) {
		String[] except = {
				  "serialVersionUID"
				, "createon"
				, "modifyon"
				, "checked"
		};
		if (delimitter == null || delimitter.replaceAll("\\s+", "").length() == 0) {
			delimitter = " AND ";
		}
		
		Map<String, Object> values = new HashMap<String, Object>();
		List<String> statement = new ArrayList<String>();
		String shortName = clazz.getSimpleName().toLowerCase().substring(0, 3) + "0";
		String name = clazz.getSimpleName();
		
		String selectClause = "SELECT " + shortName + " FROM " + name + " " + shortName;
		readValues(example, clazz, except, values, statement, shortName, DateCompare.EQUALS);
		
		if(statement.size() > 0){
			selectClause += " WHERE " + StringUtils.join(statement, delimitter);
		}
		
		System.out.println("DaoUtil.findByExampleQueryRaw()\n" + selectClause + "\n");
		
		return new FindByExample(selectClause, values, em.createQuery(selectClause, clazz));
	}

	private static void readValues(Object example, Class<?> clazz, String[] except, Map<String, Object> values
			, List<String> statement, String shortName, DateCompare type) {
		
		List<Field> fields = readAllFields(new LinkedList<Field>(), clazz);
		for (Field field : fields) {
			field.setAccessible(true);
			try {
				Object value = field.get(example);
				
				if (value != null) {
					if (value instanceof List) {
						
					}
					else if (value instanceof SObject) {
						Map<String, Object> result = readSObject(value, value.getClass(), shortName, field.getName());
						values.putAll((Map<? extends String, ? extends Object>) result.get("values"));
						statement.addAll((Collection<? extends String>) result.get("statement"));
					}
					else {
						if (!Arrays.asList(except).contains(field.getName())) {
							values.put(field.getName().toLowerCase(), readValue(value));
							statement.add(readType(value, field.getName().toLowerCase(), shortName, type));
//							readType(value, field, owner, parameterName, type)
						}
					}
				}
			} catch (IllegalArgumentException | IllegalAccessException e) {
				e.printStackTrace();
			}
		}
		
	}
	
	public static FindByExample findByExampleQueryRaw(Object example, Class<?> clazz, EntityManager em) {
		return findByExampleQueryRaw(example, clazz, em, " AND ");
	}
	
	/**
	 * Sas query.
	 *
	 * @param query the query
	 * @param settings the settings
	 * @param clazz the clazz
	 * @param em the em
	 * @return the query
	 */
	public static Query sasQuery(String query, ScrollableSettings settings, Class<?> clazz, EntityManager em) {
		String innerQuery = query;
		Query jpaQuery = em.createQuery(query, clazz);
		Boolean whereIncluded = query.toLowerCase().contains("where");
		String name = clazz.getSimpleName();
		String shortName = clazz.getSimpleName().toLowerCase().substring(0, 3) + "0";
		Boolean isView = name.toLowerCase().endsWith("view");
		Boolean isDict = name.toLowerCase().startsWith("dict");
		Boolean isRel = name.toLowerCase().startsWith("rel");
		Boolean isShopServHotelView = name.toLowerCase().startsWith("shopservhotelview");
		Boolean isUsual = !(isView || isDict || isRel);
		String delimiter = " WHERE ";
		
//		if (isView || isDict || isRel) {
//			System.out.println("DaoUtil.sasQuery()");
//		}
		
//		try {
//			if (clazz.newInstance() instanceof SView) {
//			if (clazz instanceof SView) {
//				isView = true;
//			}
//		} catch (InstantiationException | IllegalAccessException e) {
//			e.printStackTrace();
//		}
		
//		System.out.println(
//				"\n\t  isView: " +
//				isView +
//				"\n\t, shortName: " +
//				shortName +
//				"\n\t, clazz: " +
//				clazz +
//				"\n\t, query: " +
//				query +
//				"\n\t, innerQuery: " +
//				innerQuery
//		);
		
		if (settings.getSasUser() != null) {
			if (whereIncluded) {
				delimiter = " AND ";
			}
			
			SasUser user = settings.getSasUser();
			String createdby = null;
			Integer firmid = -1;
			
			if (settings.getOnlyUserData()) {
				createdby = user.getUser().getUsername();
				innerQuery += delimiter + shortName + ".createdby = :createdby";
			}
			else {
				firmid = user.getUser().getFirmid();
				if (isView) {
					innerQuery += delimiter + shortName + ".firm = :firm";
				}
				
				if(isUsual) {
					innerQuery += delimiter + shortName + ".firmid = :firmid";
				}
			}
			
//			System.out.println("innerQuery: " +
//					innerQuery
//			);
			
			if (!isDict && !isShopServHotelView) {
				innerQuery += " ORDER BY " + shortName + ".modifyon DESC NULLS LAST";
			}
			else if(isDict){
				if(settings.getType() != null && settings.getType().length() > 0){
					whereIncluded = innerQuery.toLowerCase().contains("where");
					
					if(whereIncluded){
						innerQuery += " AND " + shortName + ".dictType = '" + settings.getType() + "'";
					}
					else {
						innerQuery += " WHERE " + shortName + ".dictType = '" + settings.getType() + "'";
					}
				}
			}
			
			jpaQuery = em.createQuery(innerQuery, clazz);
			if (settings.getOnlyUserData()) {
				jpaQuery.setParameter("createdby", createdby);
			}
			else {
				if (isView) {
					jpaQuery.setParameter("firm", firmid);
				}
				
				if(isUsual) {
					jpaQuery.setParameter("firmid", firmid);
				}
				
				
			}
		}
		
		return jpaQuery;
	}
	
//	#-----------------
	/*
	@SuppressWarnings("unchecked")
	public static <T> List<T> findByExample(T example, Class<?> clazz, EntityManager em) {
		return (List<T>) findByExampleQuery(example, clazz, em);
	}
	
	public static Query findByExampleQuery(Object example, Class<?> clazz, EntityManager em) {
		FindByExample selectClause = findByExampleQueryRaw(example, clazz, em);
		return createStatement(selectClause.getSelectClause(), selectClause.getValues(), clazz, em);
	}
	
	public static FindByExample findByExampleQueryRaw(Object example, Class<?> clazz, EntityManager em) {
		String[] except = {
				  "serialVersionUID"
				, "createon"
				, "modifyon"
		};
		
		Map<String, Object> values = new HashMap<String, Object>();
		List<String> statement = new ArrayList<String>();
		String shortName = clazz.getSimpleName().toLowerCase().substring(0, 3) + "0";
		String name = clazz.getSimpleName();
		
		String selectClause = "SELECT " + shortName + " FROM " + name + " " + shortName;
		List<Field> fields = readAllFields(new LinkedList<Field>(), clazz);
		for (Field field : fields) {
			field.setAccessible(true);
			try {
				Object value = field.get(example);
				
				if (value != null) {
					if (value instanceof List) {
						if (((List) value).size() > 0) {
							values.put(field.getName().toLowerCase(), (List) value);
							statement.add(readType(value, field.getName().toLowerCase(), shortName));
						} 
					}
					else {
						if (!Arrays.asList(except).contains(field.getName())) {
							values.put(field.getName().toLowerCase(), value);
							statement.add(readType(value, field.getName().toLowerCase(), shortName));
						}
					}
				}
			} catch (IllegalArgumentException | IllegalAccessException e) {
				e.printStackTrace();
			}
		}
		
		if(statement.size() > 0){
			selectClause += " WHERE " + StringUtils.join(statement, " AND ");
		}
		
		System.out.println(
				"\n\t  selectClause: " +
				selectClause +
				"\n\t, values: " + 
				values
		);
		
		return new FindByExample(selectClause, values);
	}
	*/
	/*
	public static Query sasQuery(String query, ScrollableSettings settings, Class<?> clazz, EntityManager em) {
		String innerQuery = query;
		Query jpaQuery = em.createQuery(query, clazz);
		String name = clazz.getSimpleName();
		String shortName = clazz.getSimpleName().toLowerCase().substring(0, 3) + "0";
		String delimiter = " WHERE ";
		Boolean whereIncluded = query.toLowerCase().contains("where");
		Boolean isView = name.toLowerCase().endsWith("view");
		Boolean isDict = name.toLowerCase().startsWith("dict");
		Boolean isRel = name.toLowerCase().startsWith("rel");
		Boolean isUsual = !(isView || isDict || isRel);
		
		if (settings.getSasUser() != null) {
			if (whereIncluded) {
				delimiter = " AND ";
			}
			
			SasUser user = settings.getSasUser();
			String createdby = null;
			Integer firmid = -1;
			
			if (settings.getOnlyUserData()) {
				createdby = user.getUser().getUsername();
				innerQuery += delimiter + shortName + ".createdby = :createdby";
			}
			else {
				firmid = user.getUser().getFirmid();
				if (isView) {
					innerQuery += delimiter + shortName + ".firm = :firm";
				}
				
				if(isUsual) {
					innerQuery += delimiter + shortName + ".firmid = :firmid";
				}
			}
			
			jpaQuery = em.createQuery(innerQuery, clazz);
			if (settings.getOnlyUserData()) {
				jpaQuery.setParameter("createdby", createdby);
			}
			else {
				if (isView) {
					jpaQuery.setParameter("firm", firmid);
				}
				
				if(isUsual) {
					jpaQuery.setParameter("firmid", firmid);
				}
				
				
			}
		}
		
		return jpaQuery;
	}
	*/
	/**
	 * Sas query raw.
	 *
	 * @param query the query
	 * @param settings the settings
	 * @param clazz the clazz
	 * @param em the em
	 * @return the string
	 */
	public static String sasQueryRaw(String query, ScrollableSettings settings, Class<?> clazz, EntityManager em) {
		String innerQuery = query;
		Query jpaQuery = em.createQuery(query, clazz);
		Boolean whereIncluded = query.toLowerCase().contains("where");
		String name = clazz.getSimpleName();
		String shortName = clazz.getSimpleName().toLowerCase().substring(0, 3) + "0";
		Boolean isView = name.toLowerCase().endsWith("view");
		Boolean isDict = name.toLowerCase().startsWith("dict");
		Boolean isRel = name.toLowerCase().startsWith("rel");
		Boolean isUsual = !(isView || isDict || isRel);
		String delimiter = " WHERE ";
		
		if (settings.getSasUser() != null) {
			if (whereIncluded) {
				delimiter = " AND ";
			}
			
			SasUser user = settings.getSasUser();
			String createdby = null;
			Integer firmid = -1;
			
			if (settings.getOnlyUserData()) {
				createdby = user.getUser().getUsername();
				innerQuery += delimiter + shortName + ".createdby = :createdby";
			}
			else {
				firmid = user.getUser().getFirmid();
				if (isView) {
					innerQuery += delimiter + shortName + ".firm = :firm";
				}
				
				if(isUsual) {
					innerQuery += delimiter + shortName + ".firmid = :firmid";
				}
			}
		}
		
		return innerQuery;
	}
	
	/**
	 * Read short name.
	 *
	 * @param clazz the clazz
	 * @return the string
	 */
	public static String readShortName(Class<?> clazz){
		return clazz.getSimpleName().toLowerCase().substring(0, 3) + "0";
	}
	
	public static String readName(Class<?> clazz){
		return clazz.getSimpleName();
	}
	
	public static TotalQuery total(ScrollableSettings settings, Class<?> clazz, EntityManager em) throws Exception {
//		Long count = (Long) em.createQuery("SELECT count(*) from Goods goo0 WHERE goo0.firmid = :firmid")
		String queryTemplate = "SELECT count(*) from %s %s";
		String shortName = readShortName(clazz);
		String query = String.format(queryTemplate, readName(clazz), shortName);
		
		query += " WHERE " + shortName + ".firmid = :firmid";
		/*
		if (clazz == Photo.class) {
			DateQuery dateQuery = readDateParams(settings, shortName + ".createon");
			query += " AND " + dateQuery.getQuery();
		}
		*/
		TotalQuery totalQuery = new TotalQuery(query, em.createNativeQuery(query));
		totalQuery.setQuery(totalQuery.getQuery().setParameter("firmid", settings.getSasUser().getUser().getFirmid()));
		
		return totalQuery;
	}
	
	private static DateQuery readDateParams(ScrollableSettings settings, String name) throws Exception{
		Boolean isSingleDate = false;
		Boolean isRangeDate = false;
		String dateStart = null;
		String dateEnd = null;
		
		for (Parametr parametr : settings.getParametrs()) {
			if(parametr.getName().toLowerCase().equals("single_date")){
				isSingleDate = true;
			}
			else if(parametr.getName().toLowerCase().equals("range_date")){
				isRangeDate = true;
			}
			else if(parametr.getName().toLowerCase().equals("date_start")){
				dateStart = parametr.getValue();
			}
			else if(parametr.getName().toLowerCase().equals("date_end")){
				dateEnd = parametr.getValue();
			}
		}
		
		if(dateStart == null){
			throw new Exception("Cannot work with NULL parametr, set dateStart parametr");
		}
		else if(!isSingleDate && !isRangeDate){
			isSingleDate = true;
		}
		else if(dateEnd == null && isRangeDate){
			dateEnd = dateStart;
		}
		
		if (isSingleDate) {
			return new SingleDateQuery(name, dateStart);
		}
		else if (isRangeDate) {
			return new RangeDateQuery(name, dateStart, dateEnd);
		}
		
		return null;
	}
	
}
