function runCode() {
    const code = document.getElementById("codeInput").value;

    // Creating a Web Worker dynamically
    const workerBlob = new Blob([`
        onmessage = function(e) {
            const start = performance.now();
            try {
                eval(e.data);
                postMessage({ time: performance.now() - start });
            } catch (err) {
                postMessage({ error: err.message });
            }
        };
    `], { type: "application/javascript" });

    const worker = new Worker(URL.createObjectURL(workerBlob));
    worker.onmessage = function(e) {
        if (e.data.error) {
            document.getElementById("executionTime").textContent = "Error: " + e.data.error;
            document.getElementById("powerUsage").textContent = "";
        } else {
            const timeMs = e.data.time;
            const estimatedPower = (timeMs / 1000) * 15; // 15W per second
            document.getElementById("executionTime").textContent = `Execution Time: ${timeMs.toFixed(2)} ms`;
            document.getElementById("powerUsage").textContent = `Estimated Power: ${estimatedPower.toFixed(4)} W`;
        }
        worker.terminate();
    };
    
    worker.postMessage(code);
}