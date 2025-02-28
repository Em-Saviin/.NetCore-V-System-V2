using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR;
using System.Threading.Tasks;

[Route("api/fingerprint")]
[ApiController]
public class FingerprintController : ControllerBase
{
    private readonly IHubContext<FingerprintHub> _hubContext;

    public FingerprintController(IHubContext<FingerprintHub> hubContext)
    {
        _hubContext = hubContext;
    }

    [HttpPost("scan")]
    public async Task<IActionResult> ScanFingerprint([FromBody] FingerprintData data)
    {
        if (data.Success)
        {
            // ✅ Send fingerprint event to web UI via SignalR
            await _hubContext.Clients.All.SendAsync("ReceiveFingerprint", "OK, I see your finger");
        }

        return Ok(new { message = "Fingerprint processed" });
    }
}

public class FingerprintData
{
    public bool Success { get; set; }
    public string? Fingerprint { get; set; }
}
