
![team](https://github.com/MohammedAladin/E_Commerce_ITI/assets/118057412/5ddea3f8-2d8f-4890-8aca-abed4b781d91)
![shop](https://github.com/MohammedAladin/E_Commerce_ITI/assets/118057412/a3561a0b-bac4-46eb-9599-eeef65df002d)
![auth](https://github.com/MohammedAladin/E_Commerce_ITI/assets/118057412/a0bde2d1-843a-4f0b-b52c-81ba524d3f0c)

# **FRUITKHA** - E-Commerce Website
- Welcome to the FRUITKHA E-Commerce website! This project is built using Java Servlet and JSP with MVC architecture,
  incorporating Front Controller pattern. It utilizes Hibernate for ORM database operations, MySQL for database management,
  and AJAX for asynchronous client-side interactions. The frontend is designed with HTML, CSS, JavaScript, Bootstrap, and jQuery.
  Tomcat is used as the server container for deploying the application.


# **Table of Contents** 
  - *Introduction*
  - *Features*
  - *Technologies Used*
  - *Installation & Usage*
  - *Contributing*

# **Introduction** 
 - FRUITKHA is an e-commerce platform designed to facilitate the buying and selling of fresh fruits.
   It provides a user-friendly interface for customers to browse through available fruits, add them to their cart, and make purchases securely.
   Admin can manage inventory, update product details, and fulfill orders efficiently.
   
# **Features** 
  - User authentication and authorization for both customers and sellers.
  - Browse fruits by category, price, or popularity.
  - Add fruits to the cart and proceed to checkout.
  - Admin dashboard to manage inventory, orders, and product listings.
  - Responsive design for seamless experience across devices.

# **Technologies Used** 
  - Java Servlet and JSP.
  - MVC Architecture with Front Controller pattern.
  - Hibernate for ORM database operations.
  - MySQL Database.
  - HTML, CSS, Bootstrap for frontend.
  - JavaScript and jQuery for client-side interactions.
  - AJAX for asynchronous operations.
  - Tomcat as the server container.

# **Installation & Usage** 
  - Dependencies
    - JAVA:
      - You can find Java17 [here](https://dev.mysql.com/downloads/installer/).
      - JAVA_HOME: path/to/java
      - Add path/to/java/bin to PATH
      - Run Command: java -version
        
    - MYSQL Database v8.0.34:
      - You can find the database server [here](https://dev.mysql.com/downloads/installer/).
      - Import the schema file e_commercedb.sql provided in the repository from your MySQL Workbench.

    - Apache Tomcat 10.1.8:
      - You can find the apache tomcat server [here](https://tomcat.apache.org/download-10.cgi).
      - Download the Windows Zip file then extract it.
      - Unpack then add the following Environment Variables:
      - CATALINA_HOME : path/to/tomcat
      - Add path/to/tomcat/bin to PATH
      
    - Apache Maven:
      - You can find Apache Maven here.
      - Download the Binary Zip Archive.
      - Unpack then add the following Environment Variables:
      - Add path/to/maven/bin to PATH
      - Run Command: mvn -version
  - Clone the repository
  - Go to the project file in the same directory as the pom.xml file and run the following command: mvn package tomcat7:deploy
    
# **Contributing** 
  - Contributions are welcome! If you'd like to contribute to FRUITKHA,
    please fork the repository and create a pull request. For major changes, please open an issue first to discuss what you would like to change.

