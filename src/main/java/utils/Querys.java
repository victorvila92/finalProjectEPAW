package utils;

public class Querys {

    public Querys(){}

    public static String getUsersQuery(){
        return "SELECT id, username, mail, password, description, phoneNumber FROM User;";
    }

    public static String getUserQueryFromName(String username){
    	return "SELECT id, mail, username, password, description, phoneNumber FROM User WHERE username = '" + username + "';";
    }
    
    public static String getUserQueryFromEmail(String mail){
    	return "SELECT id, mail, username, password, description, phoneNumber FROM User WHERE mail = '" + mail + "';";
    }
    
    public static String getUserQueryFromEmailAndUsername(String username, String mail){
    	return "SELECT id, mail, username, password, description, phoneNumber FROM User WHERE mail = '" + mail + "' OR username = '" + username + "'";
    }
    
    public static String getUserQueryFromUsernameAndPassword(String username, String password){
    	return "SELECT id, mail, username, password, description, phoneNumber FROM User WHERE password = '" + password + "' AND username = '" + username + "'";
    }

    public static String insertUserQuery(String username, String mail, String password){
        return "INSERT INTO User VALUES (null, '" + username + "','" + mail + "','" + password + "', null, null, null);";
    }

    public static String insertUserQuery(String username, String mail, String description, String password){
        return "INSERT INTO User VALUES (null, '" + username + "','" + mail + "','" + password + "', '"+ description +"', null, null);";
    }

    public static String insertUserQuery(String username, String mail, String password, String description, String phoneNumber){
        return "INSERT INTO User VALUES (null, '" + username + "','" + mail + "','" + password + "', '"+ description +"', '" + phoneNumber + "', null);";
    }
    
    
    // post 
    public static String insertPost(  String author, String title, String content, String eventime, String place, String postime, String interest){
        return "INSERT INTO Post VALUES (null, '" + author + "', '" + title + "','" + content + "'"+ ", '"+ eventime+ "', '"+place+"','0','"+postime+"','"+ interest+ "');";
    }
    
    public static String getPostsQueryFromName(String Username){
        return "SELECT * FROM Post where author = ; '"+ Username +  "' ";
    }
    
    public static String getAllPosts(){
        return "SELECT * FROM Post ORDER BY time DESC;";
    }
    
    public static String gettAllPostInterest (String interest){
    	  return "SELECT * FROM Post where interest = '"+interest+"' ORDER BY time DESC;";
    }
    
}

