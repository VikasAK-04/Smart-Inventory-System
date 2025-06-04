<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Stockeye MoveIt</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" />
    <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Poppins', sans-serif;
            }

            body {
                background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
                min-height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
                padding: 20px;
            }

            .container {
                width: 100%;
                max-width: 500px;
                background: rgba(255, 255, 255, 0.9);
                border-radius: 20px;
                box-shadow: 0 15px 30px rgba(0, 0, 0, 0.25);
                overflow: hidden;
                backdrop-filter: blur(10px);
                border: 1px solid rgba(255, 255, 255, 0.3);
            }

            header {
                background: linear-gradient(to right, #4776E6, #8E54E9);
                color: white;
                padding: 25px 30px;
                text-align: center;
            }

            header h1 {
                font-size: 28px;
                font-weight: 600;
                margin-bottom: 5px;
            }

            header p {
                font-size: 14px;
                opacity: 0.9;
            }

            .form-container {
                padding: 30px;
            }

            .input-group {
                margin-bottom: 25px;
                position: relative;
            }

            .input-group label {
                display: block;
                margin-bottom: 8px;
                font-weight: 500;
                color: #333;
                font-size: 15px;
            }

            .input-field {
                position: relative;
            }

            .input-field i {
                position: absolute;
                left: 15px;
                top: 50%;
                transform: translateY(-50%);
                color: #777;
            }

            .input-field input {
                width: 100%;
                padding: 15px 15px 15px 45px;
                border: 2px solid #ddd;
                border-radius: 10px;
                font-size: 16px;
                transition: all 0.3s ease;
                outline: none;
            }

            .input-field input:focus {
                border-color: #4776E6;
                box-shadow: 0 0 0 3px rgba(71, 118, 230, 0.2);
            }

            .autocomplete-results {
                position: absolute;
                top: 100%;
                left: 0;
                right: 0;
                background: white;
                border-radius: 10px;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
                z-index: 100;
                max-height: 200px;
                overflow-y: auto;
                display: none;
                margin-top: 5px;
            }

            .autocomplete-results div {
                padding: 12px 15px;
                cursor: pointer;
                border-bottom: 1px solid #eee;
                font-size: 14px;
                display: flex;
                align-items: center;
            }

            .autocomplete-results div:last-child {
                border-bottom: none;
            }

            .autocomplete-results div:hover {
                background: #f5f7ff;
            }

            .autocomplete-results div i {
                margin-right: 10px;
                color: #4776E6;
            }

            .calculate-btn {
                background: linear-gradient(to right, #4776E6, #8E54E9);
                color: white;
                border: none;
                padding: 16px;
                width: 100%;
                border-radius: 10px;
                font-size: 16px;
                font-weight: 600;
                cursor: pointer;
                transition: all 0.3s ease;
                box-shadow: 0 5px 15px rgba(142, 84, 233, 0.4);
            }

            .calculate-btn:hover {
                transform: translateY(-2px);
                box-shadow: 0 7px 20px rgba(142, 84, 233, 0.6);
            }

            .calculate-btn:active {
                transform: translateY(1px);
            }

            .result-container {
                padding: 0 30px 30px;
                display: none;
            }

            .result-box {
                background: white;
                border-radius: 15px;
                padding: 25px;
                text-align: center;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
                border: 1px solid #eee;
            }

            .result-box h2 {
                color: #333;
                margin-bottom: 15px;
                font-size: 22px;
            }

            .distance-value {
                font-size: 42px;
                font-weight: 700;
                color: #4776E6;
                margin: 10px 0;
            }

            .distance-unit {
                color: #666;
                font-size: 18px;
            }

            .route-info {
                margin-top: 20px;
                padding-top: 20px;
                border-top: 1px dashed #ddd;
                display: flex;
                justify-content: space-between;
            }

            .route-info div {
                text-align: center;
                flex: 1;
            }

            .route-info div p:first-child {
                font-weight: 500;
                color: #555;
                font-size: 14px;
            }

            .route-info div p:last-child {
                font-weight: 600;
                color: #333;
                margin-top: 5px;
                font-size: 16px;
            }

            .map-placeholder {
                height: 300px;
                background: #f0f4ff;
                border-radius: 10px;
                margin-top: 20px;
                display: flex;
                align-items: center;
                justify-content: center;
                color: #4776E6;
                font-weight: 500;
            }

            #route-map {
                height: 300px;
                width: 100%;
                border-radius: 10px;
                margin-top: 20px;
                display: none;
            }

            .reset-btn {
                background: #f1f4f9;
                color: #4776E6;
                border: none;
                padding: 12px 20px;
                width: 100%;
                border-radius: 10px;
                font-size: 15px;
                font-weight: 600;
                cursor: pointer;
                margin-top: 20px;
                transition: all 0.3s ease;
            }

            .reset-btn:hover {
                background: #e6ebff;
            }

            footer {
                text-align: center;
                padding: 20px;
                color: rgba(255, 255, 255, 0.8);
                font-size: 14px;
                background: rgba(0, 0, 0, 0.1);
                margin-top: 20px;
                border-radius: 0 0 20px 20px;
            }

            @media (max-width: 600px) {
                .container {
                    border-radius: 15px;
                }

                header {
                    padding: 20px;
                }

                .form-container {
                    padding: 20px;
                }

                .distance-value {
                    font-size: 36px;
                }
            }

            /* Add new styles for inventory section */
            .inventory-section {
                background: white;
                border-radius: 15px;
                padding: 25px;
                margin-top: 20px;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            }

            .tomato-crate {
                display: flex;
                align-items: center;
                padding: 10px;
                margin: 5px 0;
                border-radius: 8px;
                background: #fff;
                border: 1px solid #eee;
                transition: all 0.3s ease;
            }

            .tomato-crate:hover {
                transform: translateX(5px);
                box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            }

            .crate-tag {
                font-family: monospace;
                font-weight: 600;
                padding: 4px 8px;
                border-radius: 4px;
                margin-right: 15px;
                background: #4776E6;
                color: white;
            }

            .shelf-life-indicator {
                display: inline-block;
                padding: 4px 8px;
                border-radius: 4px;
                font-size: 12px;
                font-weight: 500;
                margin-right: 15px;
            }

            .shelf-life-critical {
                background: #f8d7da;
                color: #721c24;
                animation: pulse 2s infinite;
            }

            .shelf-life-warning {
                background: #fff3cd;
                color: #856404;
            }

            .shelf-life-good {
                background: #e6f4ea;
                color: #1e7e34;
            }

            @keyframes pulse {
                0% { opacity: 1; }
                50% { opacity: 0.7; }
                100% { opacity: 1; }
            }

            .delivery-status {
                margin-left: auto;
                font-weight: 600;
            }

            .priority-high {
                color: #dc3545;
            }

            .priority-medium {
                color: #ffc107;
            }

            .priority-low {
                color: #28a745;
            }
        </style>
</head>
<body>
    <div class="container">
        <header>
            <h1><i class="fas fa-route"></i> Stockeye MoveIt</h1>
            <p>Calculate distance between any two locations</p>
        </header>

        <div class="form-container">
            <div class="input-group">
                <label for="from">From:</label>
                <div class="input-field">
                    <i class="fas fa-map-marker-alt"></i>
                    <input type="text" id="from" placeholder="Enter starting point">
                    <div class="autocomplete-results" id="from-results"></div>
                </div>
            </div>

            <div class="input-group">
                <label for="to">To:</label>
                <div class="input-field">
                    <i class="fas fa-flag-checkered"></i>
                    <input type="text" id="to" placeholder="Enter destination">
                    <div class="autocomplete-results" id="to-results"></div>
                </div>
            </div>

            <button class="calculate-btn" id="calculate">
                <i class="fas fa-calculator"></i> Calculate Distance
            </button>
        </div>

        <div class="result-container" id="result-container">
            <div class="result-box">
                <h2>Distance Between Locations</h2>
                <div class="distance-value" id="distance">0</div>
                <div class="distance-unit">kilometers</div>

                <div class="route-info">
                    <div>
                        <p>STARTING POINT</p>
                        <p id="start-location">-</p>
                    </div>
                    <div>
                        <p>DESTINATION</p>
                        <p id="end-location">-</p>
                    </div>
                </div>

                <div id="route-map"></div>
                <div class="map-placeholder" id="map-placeholder">
                    <div>
                        <i class="fas fa-map"></i>
                        <p>Route Map Visualization</p>
                    </div>
                </div>

                <div class="inventory-section">
                    <h3>Tomato Inventory Management</h3>
                    <div id="tomato-inventory">
                        <!-- Tomato crates will be displayed here -->
                    </div>
                </div>
            </div>

            <button class="reset-btn" id="reset">
                <i class="fas fa-redo"></i> Calculate Another Distance
            </button>
        </div>

        <footer>
            <p>© 2023 Stockeye MoveIt | Using OpenStreetMap data</p>
        </footer>
    </div>

    <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>
    <script>
        // LocationIQ API key
        const LOCATIONIQ_API_KEY = 'pk.eaa6d3df2b45ba440311e897cc9e9dec';

        // DOM elements
        const elements = {
            fromInput: document.getElementById('from'),
            toInput: document.getElementById('to'),
            fromResults: document.getElementById('from-results'),
            toResults: document.getElementById('to-results'),
            calculateBtn: document.getElementById('calculate'),
            resultContainer: document.getElementById('result-container'),
            distanceElement: document.getElementById('distance'),
            startLocation: document.getElementById('start-location'),
            endLocation: document.getElementById('end-location'),
            resetBtn: document.getElementById('reset'),
            mapPlaceholder: document.getElementById('map-placeholder'),
            tomatoInventory: document.getElementById('tomato-inventory')
        };

        // Initialize variables
        let map = null;
        let routeLayer = null;

        // Tomato inventory data
        const tomatoInventory = [
            { id: 'T001', harvestDate: new Date(2025, 5, 28), shelfLife: 10, quantity: 20, location: 'Warehouse A' },
            { id: 'T002', harvestDate: new Date(2025, 6, 1), shelfLife: 5, quantity: 20, location: 'Warehouse A' },
            { id: 'T003', harvestDate: new Date(2025, 5, 13), shelfLife: 9, quantity: 20, location: 'Warehouse B' },
            { id: 'T004', harvestDate: new Date(2025, 5, 12), shelfLife: 3, quantity: 20, location: 'Warehouse B' },
            { id: 'T005', harvestDate: new Date(2025, 5, 11), shelfLife: 9, quantity: 20, location: 'Warehouse A' }
        ];

        // Function to get place suggestions
        async function getPlaceSuggestions(query) {
            if (!query || query.length < 3) return [];
            try {
                // Using string concatenation instead of template literals
                const url = 'https://us1.locationiq.com/v1/autocomplete?key=' + LOCATIONIQ_API_KEY +
                            '&q=' + encodeURIComponent(query) +
                            '&limit=5&normalizecity=1';
                const response = await fetch(url);
                return await response.json();
            } catch (error) {
                console.error('Error fetching place suggestions:', error);
                return [];
            }
        }

        // Function to show autocomplete results
        async function showAutocompleteResults(input, resultsContainer, value) {
            if (!value || value.length < 3) {
                resultsContainer.style.display = 'none';
                return;
            }

            const places = await getPlaceSuggestions(value);
            if (places.length === 0) {
                resultsContainer.style.display = 'none';
                return;
            }

            resultsContainer.innerHTML = '';
            places.forEach(place => {
                const div = document.createElement('div');
                // Using string concatenation instead of template literals
                div.innerHTML = '<i class="fas fa-map-pin"></i> ' + place.display_name;
                div.addEventListener('click', () => {
                    input.value = place.display_name;
                    input.dataset.lat = place.lat;
                    input.dataset.lon = place.lon;
                    resultsContainer.style.display = 'none';
                });
                resultsContainer.appendChild(div);
            });
            resultsContainer.style.display = 'block';
        }

        // Function to geocode a place
        async function geocodePlace(place) {
            // Using string concatenation instead of template literals
            const url = 'https://us1.locationiq.com/v1/search.php?key=' + LOCATIONIQ_API_KEY +
                        '&q=' + encodeURIComponent(place) + '&format=json';
            const response = await fetch(url);
            const data = await response.json();
            return { lat: data[0].lat, lon: data[0].lon };
        }

        // Function to get distance
        async function getDistance(fromCoords, toCoords) {
            // Using string concatenation instead of template literals
            const url = 'https://us1.locationiq.com/v1/directions/driving/' +
                        fromCoords.lon + ',' + fromCoords.lat + ';' +
                        toCoords.lon + ',' + toCoords.lat +
                        '?key=' + LOCATIONIQ_API_KEY + '&overview=false';

            const response = await fetch(url);
            const data = await response.json();
            return data.routes[0].distance / 1000; // Convert to km
        }

        // Initialize map
        function initMap() {
            if (map) map.remove();
            map = L.map('route-map').setView([0, 0], 2);
            L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                attribution: '© OpenStreetMap contributors'
            }).addTo(map);
        }

        // Draw route on map
        async function drawRoute(fromCoords, toCoords) {
            if (!map) initMap();
            if (routeLayer) map.removeLayer(routeLayer);

            // Add markers
            L.marker([fromCoords.lat, fromCoords.lon]).addTo(map);
            L.marker([toCoords.lat, toCoords.lon]).addTo(map);

            // Using string concatenation instead of template literals
            const url = 'https://us1.locationiq.com/v1/directions/driving/' +
                        fromCoords.lon + ',' + fromCoords.lat + ';' +
                        toCoords.lon + ',' + toCoords.lat +
                        '?key=' + LOCATIONIQ_API_KEY + '&overview=full&geometries=geojson';

            const response = await fetch(url);
            const data = await response.json();

            routeLayer = L.geoJSON(data.routes[0].geometry, {
                style: { color: '#4776E6', weight: 5, opacity: 0.7 }
            }).addTo(map);

            map.fitBounds(routeLayer.getBounds(), { padding: [50, 50] });
            document.getElementById('route-map').style.display = 'block';
            elements.mapPlaceholder.style.display = 'none';
        }

        // Calculate remaining shelf life
        function calculateRemainingShelfLife(harvestDate, totalShelfLife) {
            const today = new Date();
            const daysSinceHarvest = Math.floor((today - harvestDate) / (1000 * 60 * 60 * 24));
            return totalShelfLife - daysSinceHarvest;
        }

        // Get shelf life status
        function getShelfLifeStatus(remainingDays) {
            if (remainingDays <= 2) return 'critical';
            if (remainingDays <= 5) return 'warning';
            return 'good';
        }

        // Get delivery priority
        function getTomatoDeliveryPriority(distance, remainingDays) {
            if (remainingDays <= 2) return 'High Priority - Critical Shelf Life';
            if (distance > 100) return remainingDays > 5 ? 'High Priority - Long Distance' : 'Medium Priority';
            return remainingDays <= 5 ? 'High Priority - Short Distance' : 'Low Priority';
        }

        // Update tomato inventory display
        function updateTomatoInventory(distance) {
            elements.tomatoInventory.innerHTML = '';

            // Sort tomatoes based on shelf life and distance
            const sortedTomatoes = [...tomatoInventory].sort((a, b) => {
                const aRemaining = calculateRemainingShelfLife(a.harvestDate, a.shelfLife);
                const bRemaining = calculateRemainingShelfLife(b.harvestDate, b.shelfLife);

                if (aRemaining <= 2 && bRemaining > 2) return -1;
                if (bRemaining <= 2 && aRemaining > 2) return 1;
                if (distance > 100) return bRemaining - aRemaining;
                return aRemaining - bRemaining;
            });

            sortedTomatoes.forEach(tomato => {
                const remainingDays = calculateRemainingShelfLife(tomato.harvestDate, tomato.shelfLife);
                const shelfLifeStatus = getShelfLifeStatus(remainingDays);
                const priority = getTomatoDeliveryPriority(distance, remainingDays);

                const crateElement = document.createElement('div');
                crateElement.className = 'tomato-crate';
                // Using string concatenation instead of template literals
                crateElement.innerHTML =
                    '<span class="crate-tag">' + tomato.id + '</span>' +
                    '<span class="shelf-life-indicator shelf-life-' + shelfLifeStatus + '">' +
                        remainingDays + ' days remaining' +
                    '</span>' +
                    '<span>' + tomato.quantity + 'kg | ' + tomato.location + '</span>' +
                    '<span class="delivery-status priority-' + shelfLifeStatus + '">' +
                        priority +
                    '</span>';

                elements.tomatoInventory.appendChild(crateElement);
            });
        }

        // Calculate button event handler
        async function handleCalculate() {
            const from = elements.fromInput.value.trim();
            const to = elements.toInput.value.trim();

            if (!from || !to) {
                alert('Please enter both starting point and destination');
                return;
            }

            elements.calculateBtn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Calculating...';
            elements.calculateBtn.disabled = true;

            try {
                const fromCoords = await geocodePlace(from);
                const toCoords = await geocodePlace(to);
                const distance = await getDistance(fromCoords, toCoords);

                elements.distanceElement.textContent = distance.toLocaleString(undefined, { maximumFractionDigits: 2 });
                elements.startLocation.textContent = from;
                elements.endLocation.textContent = to;

                updateTomatoInventory(distance);
                await drawRoute(fromCoords, toCoords);

                elements.resultContainer.style.display = 'block';
                elements.resultContainer.scrollIntoView({ behavior: 'smooth' });
            } catch (error) {
                alert('Could not calculate distance. Please try again.');
            } finally {
                elements.calculateBtn.innerHTML = '<i class="fas fa-calculator"></i> Calculate Distance';
                elements.calculateBtn.disabled = false;
            }
        }

        // Reset button event handler
        function handleReset() {
            elements.fromInput.value = '';
            elements.toInput.value = '';
            elements.resultContainer.style.display = 'none';
            document.getElementById('route-map').style.display = 'none';
            elements.mapPlaceholder.style.display = 'flex';
            if (map) {
                map.remove();
                map = null;
            }
            elements.fromInput.focus();
        }

        // Initialize event listeners
        function initEventListeners() {
            elements.fromInput.addEventListener('input', () => {
                showAutocompleteResults(elements.fromInput, elements.fromResults, elements.fromInput.value);
            });

            elements.toInput.addEventListener('input', () => {
                showAutocompleteResults(elements.toInput, elements.toResults, elements.toInput.value);
            });

            document.addEventListener('click', (e) => {
                if (e.target !== elements.fromInput) elements.fromResults.style.display = 'none';
                if (e.target !== elements.toInput) elements.toResults.style.display = 'none';
            });

            elements.calculateBtn.addEventListener('click', handleCalculate);
            elements.resetBtn.addEventListener('click', handleReset);
        }

        // Initialize application
        function initApp() {
            initEventListeners();
            elements.fromInput.focus();
        }

        // Start the application
        window.addEventListener('DOMContentLoaded', initApp);
    </script>
</body>
</html>