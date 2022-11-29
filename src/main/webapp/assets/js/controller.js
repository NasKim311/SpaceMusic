
		var tag = document.createElement('script');
            tag.src = "https://www.youtube.com/iframe_api";
        var firstScriptTag = document.getElementsByTagName('script')[0];
            firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
          
          var player; // 유튜브 영상을 실행하는 영상 플레이어
          var url; // 재생하고자 하는 유튜브 영상 URL
          var startnum = 1; //처음 시작 노래 번호 (바뀔 일 없음)
          var lastnum = 6; // 마지막 노래 번호 (DB count 해서 갖고와야됨)
          var now = 1; // 현재 노래 위치
      	  var i = 0;
		  var width = 1;
          var song = [0,2680,2390,2730,2570,2470,1680];
          var id;
          var id2;
          var songStart;
          var songFinish; 
          var temp = 0; // 현재 진행중인 영상 시간을 가져오기 위한 변수
          var end;
          var getId;
          var songtime;
          var time;
          const MusicArr = document.getElementById("MusicArr").value;
          var current; // 현재 노래를 찾기 위해 필요함
          var tempArr = [];
          tempArr = MusicArr.split(',');
          tempArr[0] = tempArr[0].substring(1);
          tempArr[tempArr.length - 1] = tempArr[tempArr.length - 1].replace(']', '');
          
          
        
        function onYouTubeIframeAPIReady() {
          if(url != "undefined")
          {
              player = new YT.Player('youtube_player', {
                    height: '400',           
                    width: '480',
                    videoId: 'EBMwWyAPtmI',
              
                 });
          }
        }
        
        
        
  	function changeY(clicked_id) {
		end = document.getElementById("songtime");
  		getId = clicked_id.slice(5); // 현재 곡 아이디 값을 가져옴
  		songtime = document.getElementById("music_time"+getId).innerHTML; // 노래 재생시간을 가져옴
  		time = songtime.split(':'); // time[0] : min , time[1] : sec 
  		 now = 1;
         // src에 저장된 해당 유튜브 영상 아이디를 가져옴
         url = $("#"+clicked_id).attr('src');
         // 해당 유튜브 영상에 썸네일을 modal창에 보이게함
         $("#imageTest").attr('src', 'http://img.youtube.com/vi/' + url + '/maxresdefault.jpg');			// <<<< 썸네일
         // youtube player에 해당 url을 통해 실행
         player.loadVideoById(url); 																		// <<<< DB에서 url 받아와서 삽입 여기서 url 받아서 재생
         width = 1;
         temp = 0;
         move();
		 end.innerHTML = time[0].trim() + ":" + time[1].trim();
		 for( var l = 0 ; l < MusicArr.length ; l++ )
			{	
				if(getId === tempArr[l].trim())
				{
					current = l;
				}
			}
		}
		
		
		
           function move() {
             if (i == 0) {
               i = 1;
               var elem = document.getElementById("myBar");
               var run = document.getElementById("runningtime");
               var nowVideoMin; // 현재 영상 분
               var nowVideoSec; // 현재 영상 초
               id2 = setInterval(() => {
                  temp++;
                  // 60초가 넘는지 확인함
                  if(temp >= 60)
                  {
                  nowVideoMin = temp / 60;
                  nowVideoSec = temp % 60;
                        // 초가 10초가 넘지 않으면 앞에 0을 붙혀줌
                     if(nowVideoSec < 10)
                     {
                     run.innerHTML = "0"+Math.floor(nowVideoMin) +":0" +Math.floor(nowVideoSec); 
                     }else
                     {
                     run.innerHTML = "0"+Math.floor(nowVideoMin) +":" +Math.floor(nowVideoSec);    
                     }
                  }else
                  {
                     nowVideoSec = temp % 60;
                      if(nowVideoSec < 10)
                     {
                         run.innerHTML = "00:0"+Math.floor(nowVideoSec);
                     }else
                     {
                        run.innerHTML = "00:"+Math.floor(nowVideoSec);
                     }
                  }
            }, 1000);
               // 초가 10초가 넘지 않으면 앞에 0을 붙혀
              // 10이 1초임
               id = setInterval(frame, (time[0]*600) + (time[1]* 10));
               function frame() {
                 if (width >= 100) {
                   clearInterval(id);
                   i = 0;
                 } else {
                   width++;
                   elem.style.width = width + "%"; 
                 }
               }
             }
           }
           // 유튜브 재실행
           function restart()
           {	
               player.loadVideoById(url);
               temp = 0;
               width = 1;
           }
           // 유튜브 플레이
           function playYoutube() {
            player.playVideo();
            move();
           }
           // 유튜브 일시정지
           function pauseYoutube() {
               player.pauseVideo();
               i = 0;
               clearInterval(id);
               clearInterval(id2);
           }
           // 앨범에 입력한 이전 곡
           function prev() {

				if(current > 0 )
				{	
					current--;
					var go = "modal" + tempArr[current].trim();
				 	changeY(go);
				}

           }
           // 앨범에 입력한 다음 곡
           function next() {
			if(current < tempArr.length - 1)
				 {
					current++;
					var go = "modal" + tempArr[current].trim();
				 	changeY(go);
				}	 
           }