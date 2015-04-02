 $('#example').dataTable( {
        "bprocessing": true,
        "processing": true,
        "serverSide": true,
        "bserverSide": true,
        "bDeferRender": true,
        "aLengthMenu": [10, 25, 40],
        "bPaginate":true, 
        "sPaginationType":"full_numbers",
        "sAjaxSource" : baseURL+ "cms/get_users_2/",
        "sServerMethod": "POST",
        "fnServerData": function ( sSource, aoData, fnCallback, oSettings ) {
          oSettings.jqXHR = $.ajax({
            "type": "POST",
            "url": sSource,
            "success": fnCallback,
            "headers":{
                    "session-key": "6renssjayfcnzlbobasz45335tyv70sa",
                    "page":1}
            });
        },
        "fnCallback" :function(data){
            debugger;
        },
        // "fnCreatedRow": function ( row, data, index ) {
        //     debugger;
        //     var serviceStatus= data[7];
        //     var isLocked = data[8];
        //     if(isLocked == "true"){
        //         setViewAction(row);
        //     }else{
        //         setActionButtons(serviceStatus,row);
        //     }
        // },
        // "ajax": {
        //     "type": "POST",
        //     "url": baseURL+ "cms/get_users/",
        //     "headers":{
        //         "session-key": "f0enlv1rkom2xla3s3xy8l199ns72x0c",
        //         "page":1}
        // },
        "lengthChange": false,
        "aoColumns": [
            {"data" : "name"},
            {"data" : "mobile"},
            {"data" : "profile_image"},
            {"data" : "id"},
            {"data" : "credits"},
            {"data" : "is_admin"},
            {"data" : "email"}
        ]
    });

    // var table = $('#merchantTable').DataTable({
    //     "bProcessing": true,
    //     "bPaginate" : true,
    //     "sPaginationType" : "full_numbers",
    //     "bServerSide" : true,
    //     "oLanguage": {
    //            "sLengthMenu": 'Show <span class="datatable-dropdown"><select class="showEntries">'+
    //             '<option value="10">10</option>'+
    //             '<option value="25">25</option>'+
    //             '<option value="50">50</option>'+
    //             '<option value="100">100</option>'+
    //             '</select></span> entries',
    //             "sProcessing": "<img src='/netspay-ui/images/ajax-loader.gif'>"
    //     },
    //     "dom": '<"toolbar">frtlp',
    //     "sAjaxSource" : "${getServiceTypesJson}",
    //     "fnCreatedRow": function ( row, data, index ) {
    //         var serviceStatus= data[7];
    //         var isLocked = data[8];
    //         if(isLocked == "true"){
    //             setViewAction(row);
    //         }else{
    //             setActionButtons(serviceStatus,row);
    //         }
    //     },
    //     "aoColumnDefs" : [ {"data" : null,"bSortable" : false,"aTargets" : [ -1 ],"defaultContent" : action,"sClass" : "center"    }, {
    //         "aTargets" : [ 0 ],"bVisible" : false} ,{"aTargets" : [ 1 ],"bSortable" : false},{"aTargets" : [ -2 ],"bVisible" : false}  ],
    //         "fnServerParams": function (aoData) {
    //             aoData.push({ "name": "M_FILTER", "value": $('#opt_filter option:selected').val() });
    // }
    // });