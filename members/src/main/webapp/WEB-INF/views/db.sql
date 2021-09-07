CREATE TABLE allgoods(
  id VARCHAR(50),
  pass VARCHAR(100) NOT NULL,
  name VARCHAR(30) NOT NULL,
  phoneNum VARCHAR(50) NOT NULL,
  email VARCHAR(100) NOT NULL,
  
  PRIMARY KEY(id)
);

insert into allgoods values('admin', 'admin', 'admin', 'admin', 'admin' );

 SELECT * FROM allgoods; 
 
 drop table allgoods;