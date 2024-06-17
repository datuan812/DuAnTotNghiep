function isNumber(input){
    try {
        let res  = input.replace(/\s/g, '');
        if(res  === ""){
            return false;
        }

        if (isNaN(res)) {
            return false;
        }
        return res;
    }
    catch(err) {
        return false;
    }
}