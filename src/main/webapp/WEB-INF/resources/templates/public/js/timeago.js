 function timeDifference(current, previous) {
            
            var msPerMinute = 60 * 1000;
            var msPerHour = msPerMinute * 60;
            var msPerDay = msPerHour * 24;
            var msPerMonth = msPerDay * 30;
            var msPerYear = msPerDay * 365;
            
            var elapsed = current - previous;
            
            if (elapsed < msPerMinute) {
                 return Math.round(elapsed/1000) + ' giây trước';   
            }
            else if (elapsed < msPerHour) {
                 return Math.round(elapsed/msPerMinute) + ' phút trước';   
            }
            
            else if (elapsed < msPerDay ) {
                 return Math.round(elapsed/msPerHour ) + ' giờ trước';   
            }

            else if (elapsed < msPerMonth) {
                 return '' + Math.round(elapsed/msPerDay) + ' ngày trước';   
            }
            
            else if (elapsed < msPerYear) {
                 return '' + Math.round(elapsed/msPerMonth) + ' tháng trước';   
            }
            
            else {
                 return '' + Math.round(elapsed/msPerYear ) + ' năm trước';   
            }
        }