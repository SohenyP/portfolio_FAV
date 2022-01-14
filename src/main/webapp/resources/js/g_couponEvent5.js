/**
 * 
 */

        // D-day
        function dDayCalc() {
            let openDate = new Date("12 01, 2022 12:00:00").getTime();
            
            let x = setInterval(function() {
            // 현재시간
            let now = new Date().getTime();
            // 남은 시간
            let remain = openDate - now;
    
            let day = Math.floor(remain / (1000 * 60 * 60 * 24));
            let hour = Math.floor(remain % (1000 * 60 * 60 * 24) / (1000 * 60 * 60));
            let min = Math.floor(remain % (1000 * 60 * 60) / (1000 * 60));
            let sec = Math.floor(remain % (1000 * 60) / (1000));
            
    
    
            document.getElementById("count").innerHTML = `D - ${day} <br> ${(hour<10)? "0"+hour:hour} : ${(min<10)? "0"+min:min} : ${(sec<10)? "0"+sec:sec} `;
    
            // 디데이 알림
            if(remain < 0) {
                clearInterval(x);
                document.getElementById("remain").innerHTML = "D-day";
            }
        });
    
    }dDayCalc();