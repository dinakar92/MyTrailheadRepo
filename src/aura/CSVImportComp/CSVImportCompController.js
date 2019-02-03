({
    readCSV: function(component, event, helper) {
 		component.set("v.displayData",true);
        var filename = event.getSource().get("v.files");
 
        var textdata;
        var reader = new FileReader();
        var infolst = [];
        var errorlst = [];
        reader.onload = function() {
            var text = reader.result; 
            console.log(reader.result.substring(0, 200));
            console.log('Data from CSV file' + text);
            textdata = text;
            var rows = textdata.split('\n'); 
            console.log('File header' + rows[0]);
            component.set("v.showSpinner", false);
 
            for (var i = 1; i < rows.length; i = i + 1) {
                console.log('Length', +rows.length); 
                var cells = rows[i].split(',');
                console.log('One row' + cells);
                console.log('Row length' + cells.length);
 
                if(cells.length!=1){
                    var sports=cells[3].split('\r');
                    var cellinfo = {
                        'StudentNo': cells[0],
                        'Name': cells[1],
                        'Date': cells[2],
                        'Sports': sports[0],
                    };
                    
                    infolst.push(cellinfo);
                }
            }
            for (var i = 0; i < infolst.length - 1; i = i + 1) {
                if (infolst[i].Sports == '') {
                    var errorinfo = {
                        'StudentName': infolst[i].Name,
                        'Error': 'This student is not involved in any Sport.',
                    };
                    errorlst.push(errorinfo);
                }
            }
            if (errorlst.length > 0) {
                component.set("v.errorsFound",true);
                component.set("v.errorData",errorlst);
            }
 			component.set("v.data",infolst); 
        };
        if (filename[0] !== undefined && filename[0] !== null && filename[0] !== '') {
            reader.readAsText(filename[0]);
        }
    }
 })