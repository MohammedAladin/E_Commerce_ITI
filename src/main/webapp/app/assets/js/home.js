function showAllProducts() {
            console.log("inside showAllProducts");
            if (window.XMLHttpRequest) {
                req = new XMLHttpRequest();
            } else if (window.ActiveXObject) {
                req = new ActiveXObject("Microsoft.XMLHTTP");
            }
            req.onreadystatechange = handleReq;
            var timestamp = new Date().getTime();
            var email = "yousif@gmail.com";
            var url = "app/Hom2?date=" + timestamp + "&email=" + encodeURIComponent(email);
            req.open("GET", url, true);
            req.send(null);
        }

        function handleReq() {
            console.log("inside handleReq");
            if (req.readyState == 4 &&req.status == 200)
                {
                    var valuee = req.responseText;
                    document.getElementById("emailll").value = valuee;
                    console.log("email value = "+valuee);
                }
                else{
                document.getElementById("emailll").value = "error code  " + req.status;
                }
        }

