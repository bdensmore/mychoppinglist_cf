/**
* I am a new Model Object
*/
component  mappedSuperClass="true"{

    property name="createdDate" column="created_date" ormtype="timestamp";
	
	public Base function init(){
		
		return this;
	}
	

}
