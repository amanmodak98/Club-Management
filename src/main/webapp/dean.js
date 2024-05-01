document.addEventListener('DOMContentLoaded', function () {
            // Initialize FullCalendar
            $('#calendarContainer').fullCalendar({
                header: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'month,agendaWeek,agendaDay'
                },
                events: [
                    // Add your events here
                    {
                        title: 'Event 1',
                        start: '2024-03-09T10:00:00',
                        end: '2024-03-09T12:00:00'
                    },
                    {
                        title: 'Event 2',
                        start: '2024-03-15T14:00:00',
                        end: '2024-03-15T16:00:00'
                    }
                    // Add more events as needed
                ]
            });
        });

        function toggleMenu() {
            const sidebar = document.getElementById('sidebar');
            if (sidebar.style.left === '0px') {
                sidebar.style.left = '-200px';
            } else {
                sidebar.style.left = '0px';
            }
        }

        function showContent(id) {
            const contents = document.getElementsByClassName('content-item');
            for (let content of contents) {
                content.style.display = 'none';
            }
            const activeContent = document.getElementById(id);
            activeContent.style.display = 'block';
        }