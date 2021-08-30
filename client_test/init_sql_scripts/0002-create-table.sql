CREATE TABLE IF NOT EXISTS prometheus.metrics
(
    date Date DEFAULT toDate(0),
    name String,
    tags Array(String),
    val Float64,
    ts DateTime,
    updated DateTime DEFAULT now()
)
ENGINE = GraphiteMergeTree(date, (name, tags, ts), 8192, 'prom_graphite_rollup')
