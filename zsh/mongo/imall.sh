mongodb='mongo'
$mongodb <<EOF
use VnTrader_Tick_Db
db.rb1910.remove({})
db.i1909.remove({})
use VnTrader_1Min_Db
db.rb1910.remove({})
db.rb2001.remove({})
db.rb2005.remove({})
db.i1909.remove({})
db.i2001.remove({})
db.i2005.remove({})
exit;
EOF

mongoimport -d VnTrader_Tick_Db -c rb1910 --file rb1910_tick.json
mongoimport -d VnTrader_Tick_Db -c i1909 --file i1909_tick.json

mongoimport -d VnTrader_1Min_Db -c rb1910 --file rb1910_bar.json
mongoimport -d VnTrader_1Min_Db -c rb2001 --file rb2001_bar.json
mongoimport -d VnTrader_1Min_Db -c rb2005 --file rb2005_bar.json

mongoimport -d VnTrader_1Min_Db -c i1909 --file i1909_bar.json
mongoimport -d VnTrader_1Min_Db -c i2001 --file i2001_bar.json
mongoimport -d VnTrader_1Min_Db -c i2005 --file i2005_bar.json
