$(document).ready(function() {

				$('#calendar').fullCalendar({
					theme: true,
					header: {
						left: 'prev,next today',
						center: 'title',
						right: 'month,basicWeek,basicDay'
					},
					
					editable: false,
					eventLimit: true, // allow "more" link when too many events
					events: [
						{
							title: '회식	21000원',
							start: '2015-04-1T20:00:00'
						},
						{
							title: '삼겹살	32000원',
							start: '2015-04-3T19:00:00'
						},
						{
							title: '순두부	20000원',
							start: '2015-04-06T19:00:00'
						},
						{
							title: '순대국	25000원',
							start: '2015-04-09T16:00:00'
						},
						{
							title: '부대찌게	33000원',
							start: '2015-04-13T22:00:00'
						},
						{
							title: '삼겹살	40000원',
							start: '2015-04-017T21:00:00'
						},
						{
							title: '치맥	43000원',
							start: '2015-04-26T23:30:00'
						},
						{
							title: '감차짜개	21000원',
							start: '2015-04-28T15:00:00'
						},
						{
							title: '삼겹살	32000원',
							start: '2015-04-28T15:00:00'
						},
						{
							title: '순두부	43000원',
							start: '2015-04-28T12:00:00'
						},
						{
							title: '김치찌개	21000원',
							start: '2015-04-28T16:00:00'
						},
						{
							title: '꽃등심	60000원',
							start: '2015-04-28T19:00:00'
						},
						{
							title: '양념치킨	35000원',
							start: '2015-04-29T22:00:00'
						},
						{
							title: '분식	23000원',
							start: '2015-04-30T15:00:00'
						},
					]
				});
				
			});