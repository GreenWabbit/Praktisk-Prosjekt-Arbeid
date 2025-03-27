function runCode() {
    const htmlCode = document.getElementById('htmlInput').value;
    const cssCode = document.getElementById('cssInput').value;
    const jsCode = document.getElementById('jsInput').value;

    const startTime = performance.now();

    // Create an iframe to run the code
    const iframe = document.createElement('iframe');
    document.body.appendChild(iframe);
    const iframeDoc = iframe.contentDocument || iframe.contentWindow.document;

    // Write HTML, CSS, and JS to the iframe
    iframeDoc.open();
    iframeDoc.write(`
        <!DOCTYPE html>
        <html lang="en">
        <head>
            <style>${cssCode}</style>
        </head>
        <body>
            ${htmlCode}
            <script>${jsCode}<\/script>
        </body>
        </html>
    `);
    iframeDoc.close();

    const endTime = performance.now();
    const executionTime = endTime - startTime;

    // Estimate power usage (this is a placeholder, real estimation would be more complex)
    const powerUsage = executionTime * 0.0001; // Example calculation

    document.getElementById('executionTime').innerText = `Execution Time: ${executionTime.toFixed(2)} ms`;
    document.getElementById('powerUsage').innerText = `Estimated Power Usage: ${powerUsage.toFixed(4)} kWh`;

    // Remove the iframe after execution
    setTimeout(() => {
        document.body.removeChild(iframe);
    }, 1000);
}