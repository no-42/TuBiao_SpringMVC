function res_is_T(temp_arr) {
    var message=temp_arr[0]["res"];
    if (message=="T"){
        temp_arr.shift()
        return temp_arr;
    }else{
        return false;
    }
}

function get_legend(temp_array) {
    var legend_data=[];
    for (var i=0;i<temp_array.length;i++){
        legend_data.push(temp_array[i]["name"])
    }
    return legend_data;
}
function get_Axis(temp_array) {
    var Axis_data=[];
    for (var i=0;i<temp_array.length;i++){
        Axis_data.push(temp_array[i]['name']);
    }
    return Axis_data;
}
