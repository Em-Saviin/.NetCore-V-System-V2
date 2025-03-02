function InitializeOverView() {
    // Polar Area Chart
    const polarData = {
        labels: ['Red', 'Green', 'Yellow', 'Grey', 'Blue'],
        datasets: [{
            label: 'My First Dataset',
            data: [11, 16, 7, 3, 14],
            backgroundColor: [
                'rgb(255, 99, 132)',
                'rgb(75, 192, 192)',
                'rgb(255, 205, 86)',
                'rgb(201, 203, 207)',
                'rgb(54, 162, 235)'
            ]
        }]
    };

    const polarConfig = {
        type: 'polarArea',
        data: polarData,
        options: {
            responsive: true,
            plugins: {
                legend: {
                    position: 'top',
                }
            }
        }
    };

    if ($("#chartRevenue").length) {
        new Chart($("#chartRevenue"), polarConfig);
    }

    // Bar Chart
    function generateData(count, min, max) {
        let data = [];
        for (let i = 0; i < count; i++) {
            data.push(Math.floor(Math.random() * (max - min + 1) + min));
        }
        return data;
    }

    function generateMonths(count) {
        const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
        let result = [];
        for (let i = 0; i < count; i++) {
            result.push(months[i % 12]);
        }
        return result;
    }

    function colorize(value) {
        return value < -50 ? '#D60000'
            : value < 0 ? '#F46300'
                : value < 50 ? '#0358B6'
                    : '#44DE28';
    }

    const DATA_COUNT = 16;
    const barChartData = {
        labels: generateMonths(DATA_COUNT),
        datasets: [{
            label: 'Random Data',
            data: generateData(DATA_COUNT, -100, 100),
            backgroundColor: function (context) {
                const index = context.dataIndex;
                const value = context.dataset.data[index];
                return colorize(value);
            },
            borderColor: function (context) {
                const index = context.dataIndex;
                const value = context.dataset.data[index];
                return colorize(value);
            },
            borderWidth: 2
        }]
    };

    const barChartConfig = {
        type: 'bar',
        data: barChartData,
        options: {
            plugins: {
                legend: {
                    display: false
                }
            },
            elements: {
                bar: {
                    borderWidth: 2
                }
            }
        }
    };

    if ($("#dashboardBarChart").length) {
        new Chart($("#dashboardBarChart"), barChartConfig);
    }
}

 