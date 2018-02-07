$(document).ready(function () {

                var table = $('#example').DataTable({

                    lengthChange: false,
                    dom: 'Blfrtip',
                    buttons: [
                        'copy', 'csv', 'excel', 'pdf', 'print'
                    ],
                    pageLength: [
                    '50'
                    ],
                    lengthMenu: [
                    [10, 20, 25, 50, -1], [10, 20, 25, 50, 'All']
                    ],
                    language: {
                        "processing": "Przetwarzanie...",
                        "search": "Szukaj:",
                        "lengthMenu": "Pokaż _MENU_ pozycji",
                        "info": "Pozycje od _START_ do _END_ z _TOTAL_ łącznie",
                        "infoEmpty": "Pozycji 0 z 0 dostępnych",
                        "infoFiltered": "(filtrowanie spośród _MAX_ dostępnych pozycji)",
                        "infoPostFix": "",
                        "loadingRecords": "Wczytywanie...",
                        "zeroRecords": "Nie znaleziono pasujących pozycji",
                        "emptyTable": "Brak danych",
                        "paginate": {
                            "first": "Pierwsza",
                            "previous": "Poprzednia",
                            "next": "Następna",
                            "last": "Ostatnia"
                        }


                    }

                }
                );

                table.buttons().container()
                        .appendTo('#example_wrapper .col-md-6:eq(0)');

                $('.dt-button').addClass('btn btn-secondary');

            });




