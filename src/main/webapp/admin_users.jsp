<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>CRUDS</title>
        <link rel="stylesheet" href="app/assets/css/adminstyle.css">
        <link rel="stylesheet" href="app/assets/css/progressbar.css">
    </head>
    <body>

        <div class="loader">
            <div class="loader-inner">
                <div class="circle"></div>
            </div>
        </div>

        <div id="menu">
            <button onclick="location.href='admin.jsp'" type="button">
                Products
            </button>
            <button onclick="location.href='admin_orders.jsp'" type="button">
                Orders
            </button>
            <button onclick="location.href='admin_users.jsp'" type="button">
                Users
            </button>
        </div> 

        <div class="crud">
            <div class="head">
                <p>Users Managment System</p>
            </div>
            
           
            <div class="outputs">
                <div class="searchBlock">
                    <table>
                        <tr>
                            <!-- <th>Image</th> -->
                            <th>id</th>
                            <th>Customer Name</th>
                            <th>DOB</th>
                            <th>Email</th>
                            <th>PhoneNumber</th>
                            <th>Credit Limit</th>
                        </tr>
                        <tbody id="tableBody">
                            
                        </tbody>
                    </table>
                </div>

            </div>
        



        </div>


        <script src="app/assets/js/admin-users.js"></script>
    </body>
</html>