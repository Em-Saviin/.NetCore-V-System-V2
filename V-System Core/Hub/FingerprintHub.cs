using Microsoft.AspNetCore.SignalR;
using System.Threading.Tasks;

public class FingerprintHub : Hub
{ 
    public async Task ReceiveFingerprint(string fingerprintData)
    {
        Console.WriteLine($"📥 Received Fingerprint Data: {fingerprintData}");

        // Send fingerprint data to all connected web clients
        await Clients.All.SendAsync("FingerprintReceived", fingerprintData);
    }
    public async Task SendFingerprintDetected(string fingerprintData)
    {
        Console.WriteLine("📡 Received fingerprint from desktop app: " + fingerprintData);
        await Clients.All.SendAsync("ReceiveFingerprint", fingerprintData);
    }
}