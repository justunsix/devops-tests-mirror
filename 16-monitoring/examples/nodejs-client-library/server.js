const express = require("express");
const path = require("path");
const fs = require("fs");
const app = express();

// Prometheus client library - Collect default metrics
const client = require("prom-client");
const collectDefaultMetrics = client.collectDefaultMetrics;
// Probe every 5th second.
collectDefaultMetrics({ timeout: 5000 });

// Prometheus client library - HTTP requests metric
const httpRequestsTotal = new client.Counter({
  name: "http_request_operations_total",
  help: "Total number of Http requests",
});

// Histogram metric type
// Using configurable buckets
// In this case, how many request in the
// given time bucket
const httpRequestDurationSeconds = new client.Histogram({
  name: "http_request_duration_seconds",
  help: "Duration of Http requests in seconds",
  buckets: [0.1, 0.5, 2, 5, 10],
});

// Set contentType, time series
// Send metrics to /metrics, available in browser
app.get("/metrics", async (req, res) => {
  res.set("Content-Type", client.register.contentType);
  res.end(await client.register.metrics());
});

// Simulate a request time
// Actual code would not have simulation
app.get("/", function (req, res) {
  // Simulate sleep for a random number of milliseconds
  var start = new Date();
  var simulateTime = Math.floor(Math.random() * (10000 - 500 + 1) + 500);

  setTimeout(function (argument) {
    // Simulate execution time
    var end = new Date() - start;
    // Use Prometheus client library
    httpRequestDurationSeconds.observe(end / 1000); //convert to seconds
  }, simulateTime);

  httpRequestsTotal.inc();
  res.sendFile(path.join(__dirname, "index.html"));
});

app.get("/profile-picture-andrea", function (req, res) {
  const img = fs.readFileSync(
    path.join(__dirname, "images/profile-andrea.jpg"),
  );
  res.writeHead(200, { "Content-Type": "image/jpg" });
  res.end(img, "binary");
});

app.get("/profile-picture-ari", function (req, res) {
  const img = fs.readFileSync(path.join(__dirname, "images/profile-ari.jpeg"));
  res.writeHead(200, { "Content-Type": "image/jpg" });
  res.end(img, "binary");
});

app.listen(3000, function () {
  console.log("app listening on port 3000!");
});
