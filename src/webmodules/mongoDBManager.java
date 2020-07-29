package webmodules;

import java.net.UnknownHostException;
import java.security.Timestamp;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;

import com.sun.org.apache.bcel.internal.generic.DMUL;

import structures.DeviceCommon;
import structures.DeviceCommon2;
import structures.DeviceSpecific;
import sun.awt.SunHints.Value;

import org.apache.jasper.tagplugins.jstl.core.Catch;
import org.bson.Document;

import com.mongodb.*;
import com.mongodb.client.MongoCursor;

public class mongoDBManager {
	private Mongo mongo;
	private String model_name;
	private String registration_time;
	private String device_type;
	private String manufacturer;
	private String category;

	public mongoDBManager() {

	}

	public static void insertDeviceCommon(String modelName, String deviceType, String manufacturer, String catergory)
			throws UnknownHostException {
		try {
			Mongo mongo = new Mongo("localhost", 27017);
			DB db = mongo.getDB("dbtest");
			DBCollection collection = db.getCollection("device_regi3");
			Calendar cal = Calendar.getInstance();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy / MM / dd / HH:mm:ss");
			String now_time = sdf.format(cal.getTime());

			BasicDBObject document = new BasicDBObject();
			document.put("registrationTime", now_time);
			document.put("modelName", modelName);
			document.put("deviceType", deviceType);
			document.put("manufacturer", manufacturer);
			document.put("category", catergory);

			collection.insert(document);

			System.out.println("collection-----test----->>>>>" + document.size());
			BasicDBObject searchQuery = new BasicDBObject();
			// searchQuery.put("modelName", modelName);
			// DBCursor cursor = collection.find(searchQuery);
			DBCursor cursor = collection.find();

			while (cursor.hasNext()) {
				System.out.println(cursor.next());

			}

			System.out.println("몽고 디비 연결 성공");
			mongo.close();
		} catch (MongoException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<DeviceCommon> getDeviceList() throws UnknownHostException {
		ArrayList<DeviceCommon> devList = new ArrayList<DeviceCommon>();
		Mongo mongo = new Mongo("localhost", 27017);
		DB db = mongo.getDB("dbtest");
		DBCollection collection = db.getCollection("device_regi3");
		// Iterator<DBObject> cursor = collection.find().iterator();
		// DBCursor cursor2 = (DBCursor) collection.find().iterator();
		try {
			ArrayList<DBObject> doc2 = new ArrayList<DBObject>();
			DBCursor cursor2 = collection.find();
			while (cursor2.hasNext()) {
				DBObject doc = cursor2.next();
				doc2.add(doc);
				System.out.println("doctest-->>>>>>__>>>" + doc2.size()); // collection 에 있는 모든 데이터 수
				System.out.println("cursortest->>>>>>>>>>>>>>" + doc);

				ArrayList<Object> key = new ArrayList<Object>(doc.keySet()); // key 추출
				DBObject value = collection.findOne(); // value 추출

				DeviceCommon dc = new DeviceCommon();
				String id = (String) doc.get("_id").toString();
				dc.setId(id);
				// for (int i = 0; i < key.size(); i++) {
				// System.out.printf("%s : %s%n", key.get(i), value.get((String) key.get(i)));
				// System.out.printf("%s : %s%n", key.get(i), doc.get((String) key.get(i)));
				// System.out.println("<>" + key.get(i) + " : " + doc.get((String) key.get(i)));

				dc.setregistration_time(doc.get("registrationTime"));
				dc.setmodel_name(doc.get("modelName"));
				dc.setDevice_type(doc.get("deviceType"));
				dc.setManufacturer(doc.get("manufacturer"));
				dc.setCategory(doc.get("category"));
				devList.add(dc);

				// }
				System.out.println(dc.toString());
			}

			mongo.close();
		} catch (MongoException e) {
			System.out.println(e.getMessage());
		}

		return devList;
	}

	public DeviceCommon getDeviceCommon(String device_id) throws UnknownHostException {
		Mongo mongo = new Mongo("localhost", 27017);
		DB db = mongo.getDB("dbtest");
		DBCollection collection = db.getCollection("device_regi3");
		DeviceCommon dc = new DeviceCommon();
		try {
			DBCursor cursor2 = collection.find();
			while (cursor2.hasNext()) {
				DBObject doc = cursor2.next();
				System.out.println("cursortest->>>>>>>>>>>>>>" + doc);

				ArrayList<Object> key = new ArrayList<Object>(doc.keySet()); // key 추출
				DBObject value = collection.findOne(); // value 추출

				String id = (String) doc.get("_id").toString();
				if (id.equals(device_id)) {
					dc.setId(id);
					dc.setregistration_time(doc.get("registrationTime"));
					dc.setmodel_name(doc.get("modelName"));
					dc.setDevice_type(doc.get("deviceType"));
					dc.setManufacturer(doc.get("manufacturer"));
					dc.setCategory(doc.get("category"));
				}
				System.out.println(dc.toString());
			}

			mongo.close();
		} catch (MongoException e) {
			System.out.println(e.getMessage());
		}

		return dc;
	}

	public static void InsertDeviceSpecific(String device_id, ArrayList<String> keyList, ArrayList<String> valueList) {
		try {
			Mongo mongo = new Mongo("localhost", 27017);
			DB db = mongo.getDB("dbtest");
			DBCollection collection = db.getCollection("device_regi6");

			BasicDBObject document = new BasicDBObject();
			document.put("_id", device_id);
			for (int i = 0; i < keyList.size(); i++) {
				// document.removeField(keyList.get(i));
				document.put("_id", device_id);
				document.put(keyList.get(i), valueList.get(i));
			}
			collection.insert(document);
			System.out.println("collection-----test----->>>>>" + document.size());
			BasicDBObject searchQuery = new BasicDBObject();
			// searchQuery.put("modelName", modelName);
			// DBCursor cursor = collection.find(searchQuery);
			DBCursor cursor = collection.find();

			while (cursor.hasNext()) {
				System.out.println(cursor.next());

			}

			System.out.println("몽고 디비 연결 성공");
			mongo.close();
		} catch (MongoException e) {
			e.printStackTrace();
		}
	}

	public DeviceSpecific getDeviceSpecific(String device_id) {
		Mongo mongo = new Mongo("localhost", 27017);
		DB db = mongo.getDB("dbtest");
		DBCollection collection = db.getCollection("device_regi6");
		DeviceSpecific ds = new DeviceSpecific();
		try {
			DBCursor cursor2 = collection.find();
			while (cursor2.hasNext()) {
				DBObject doc = cursor2.next();
				System.out.println("cursortest->>>>>>>>>>>>>>" + doc);

				ArrayList<Object> key = new ArrayList<Object>(doc.keySet()); // key 추출
				DBObject value = collection.findOne(); // value 추출

				String id = (String) doc.get("_id").toString();
				for (int i = 0; i < key.size(); i++) {

					if (id.equals(device_id)) {
						key.remove(i);
						ds.setId(id);
						ds.add(key.get(i), doc.get((String) (key.get(i))));
					}
				}
				System.out.println(ds.toString());
			}
			mongo.close();
		} catch (MongoException e) {
			System.out.println(e.getMessage());
		}

		return ds;
	}

	public static void main(String[] args) throws UnknownHostException {
		// mongoDBManager mgb = new mongoDBManager();
		// mgb.getDeviceList();
	}
}
