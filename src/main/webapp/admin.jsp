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

        <div class="crud">
            <div class="head">
                <h2>CRUD</h2>
                <p>Product Managment System</p>
            </div>
            
            <div class="inputs">
                <input type="text" id="productName" placeholder="Product Name">
                    
                <div class="numbers">
                    <input type="number" id="price" placeholder="Price">
                    <input type="number" id="stockCount" placeholder="Stock Count">
                </div>

                
                <select id="select-category" name="select-category">
                    <option value="" disabled selected>Category</option>
                </select>
                
                <input type="text" id="desc" placeholder="Description">

                <div class="form-outline rounded-1" style="width:100% !important">
                    <label for="add-product-picture" class="custom-file-upload"><i class="fa fa-upload text-black"></i> Choose Product Image</label>
                    <input type="file"
                        class="form-control text-white bg-dark custom-file-upload"
                        id="add-product-picture"
                        name="add-product-picture" required/>
                </div>
                <button id="createBtn">Create</button>

            </div>
            <div class="outputs">
                <div class="searchBlock">
                    <div id="deleteAll"></div>
                    <table>
                        <tr>
                            <th>Image</th>
                            <th>id</th>
                            <th>Product Name</th>
                            <th>price</th>
                            <th>Stock Count</th>
                            <th>Description</th>
                            <th>category</th>
                        </tr>
                        <tbody id="tableBody">
                            
                        </tbody>
                    </table>
                </div>

            </div>
        



        </div>


        <script src="app/assets/js/adminf.js"></script>
    </body>
</html>