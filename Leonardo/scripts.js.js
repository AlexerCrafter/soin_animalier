// scripts.js

document.addEventListener("DOMContentLoaded", function() {
    const weightCtx = document.getElementById('weightChart').getContext('2d');
    const mealCtx = document.getElementById('mealChart').getContext('2d');

    fetch('get_data.php?type=weight')
        .then(response => response.json())
        .then(data => {
            new Chart(weightCtx, {
                type: 'line',
                data: {
                    labels: data.dates,
                    datasets: [{
                        label: 'Weight',
                        data: data.values,
                        borderColor: 'rgb(75, 192, 192)',
                        tension: 0.1
                    }]
                }
            });
        });

    fetch('get_data.php?type=meal')
        .then(response => response.json())
        .then(data => {
            new Chart(mealCtx, {
                type: 'line',
                data: {
                    labels: data.dates,
                    datasets: [{
                        label: 'Meal Count',
                        data: data.values,
                        borderColor: 'rgb(153, 102, 255)',
                        tension: 0.1
                    }]
                }
            });
        });
});
