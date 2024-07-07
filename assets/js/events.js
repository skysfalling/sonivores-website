// Check if jQuery is loaded
if (typeof jQuery !== 'undefined') {
    console.log('jQuery is loaded');
} else {
    console.error('jQuery is not loaded');
}

// Check if PapaParse is loaded
if (typeof Papa !== 'undefined') {
    console.log('PapaParse is loaded');
} else {
    console.error('PapaParse is not loaded');
}



// Read the CSV file and generate the event cards when the page is loaded
$(document).ready(function () {
    Papa.parse('./assets/csv/events.csv', {
        header: true,
        download: true,
        complete: function (results) {
            const eventCardsContainer = document.getElementById('event-cards-container');

            // Loop through the data and generate an event card for each row
            results.data.forEach(event => {
                if (event.name == null) return;

                const eventCard = document.createElement('div');
                eventCard.classList.add('row-container');

                const eventCardContent = `
                        <div class="column-item sonivore-container-lg0">
                            <div class="row-container sonivore-tint">
                            <h2 class="row-item">${event.name}</h2>
                            <h6 class="row-item">${event.date}</h6>
                            </div>

                            <div style="height: 200px;"></div>

                            <div class="row-container">
                            <div class="sonivore-container0">${event.venue_name}</div>
                            <div style="width: 100px;"></div>
                            <button class="sonivore-button0">Learn More</button>
                            </div>
                            <img src="../assets/images/dance-party1.jpg" alt="Background Image" class="background-image">
                        </div>
                        `;

                eventCard.innerHTML = eventCardContent;
                eventCardsContainer.appendChild(eventCard);
            });
        }
    })
});
