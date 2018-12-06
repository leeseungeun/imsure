/**
 * 심리학적 추천 결과화면 내 whySURE 예제 차트
 * 
 * @author 류세은
 */

	var options = {
			  type: 'bubble',
			  data: {
			    datasets: [
			      {
			        label: '(무)행복knowhow Top3건강보험(보장성) 3대질병보장형 순수보장형',
			        data: [
			          {
			            x: 0,
			            y: 0,
			            r: 5
			          }
			        ],
			        backgroundColor:"rgb(48, 177, 178)",
			        hoverBackgroundColor: "rgb(48, 177, 178)"
			      },
			      {
			        label: '(무)하나1Q연금저축보험',
			          data: [
			            {
			              x: -10,
			              y: 10,
			              r: 5
			            }
			          ],
			          backgroundColor:"rgb(48, 177, 178)",
			          hoverBackgroundColor: "rgb(48, 177, 178)"
			      },
			      {
			        label: '손님',
			          data: [
			            {
			              x: -8,
			              y: 8,
			              r: 5
			            }
			          ],
			          backgroundColor:"#ff0057",
			          hoverBackgroundColor: "#ff0057"
			      }
			      ]
			  }
			}

	var ctx = document.getElementById('chartJSContainer');
	var myBubbleChart = new Chart(ctx, options);