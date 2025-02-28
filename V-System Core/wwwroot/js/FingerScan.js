

// Establish connection with the SignalR hub
const connection = new signalR.HubConnectionBuilder()
    .withUrl("http://localhost:5171/fingerprintHub") // Ensure correct endpoint
    .configureLogging(signalR.LogLevel.Information)
    .build();

// Listen for FingerprintReceived event
connection.on("FingerprintReceived", (fingerprintData) => {
    console.log("📥 Fingerprint Data Received: ", fingerprintData);
    alert("✅ Fingerprint Data Received:\n" + fingerprintData);
});

// Start the SignalR connection
connection.start()
    .then(() => console.log("✅ SignalR Connected!"))
    .catch(err => console.error("❌ SignalR Connection Error:", err));
