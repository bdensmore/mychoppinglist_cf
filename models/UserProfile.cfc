/**
* I am a new Model Object
*/
component entityName="UserProfile" table="user_profiles" persistent=true extends="mychoppinglist.models.Base" {

    property name="id" fieldtype="id" generator="native";
    property name="firstName" column="first_name" ormtype="string";
    property name="lastName" column="last_name" ormtype="string";

    property name="User" fieldtype="one-to-one" cfc="mychoppinglist.models.User" fkcolumn="user_id"; 
	
	UserProfile function init(){
		
		return this;
	}
	

}
