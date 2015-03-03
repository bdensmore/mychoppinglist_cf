<cfscript>
    arrayEach( prc.user, function( u ) {
        if ( u.hasUserProfile() ) {
            writeOutput( u.getFullName() );
        }
    });
</cfscript>
