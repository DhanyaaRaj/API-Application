var tasks = require('./task')
var express = require('express')
var app = express()
var router = express.Router();
var bodyParser = require("body-parser");

app.use(bodyParser.json());       // to support JSON-encoded bodies

app.use(bodyParser.urlencoded({
    extended: true
}));
/*app.get('/', function(req, res)
{
    res.send("hi hello")
})

*/

app.use('/',router)

var promise =  new Promise(function(resolve,reject){
    
   
})
promise.then(
    router.get('/:id', function(req, res){ 
   
        tasks. gettaskbyId (req.params.id, function(err, datas) {  
            if (err) {  
                res.send(err);  
            } else {  
                res.send(datas);  
            }  
    
        })
    })
    ).catch( router.get('/', function(req, res){ 
        
        tasks.getalltask(function(err, datas) {  
            if (err) {  
                res.send(err);  
            } else {  
                res.send(datas);  
            }  
        })
    }));
   router.put('/',function(req,res)
   {
      
       tasks.updatetask([req.body.name,req.body.product,req.body.id],function(err,datas)
       {
           if(err)
           {
               res.send(err)
           }
           else
           {
               res.send(datas)
           }
       })
   })
   router.delete('/:id',function(req,res){
       tasks.deletetask([req.params.id],function(err,datas)
       {
          if(err)
         {
            res.send(err)
         }
         else
           {
            res.send(datas)
           }
       })

   })

   router.post('/',function(req,res)
   {
       tasks.posttask([req.body.id,req.body.name,req.body.city,req.body.product],function(err,datas)
       {
           if(err)
           {
               res.send(err)
           }
           else
           {
            res.send(datas)
           }
       })
   })
   

app.listen(3000,function()
{
    console.log("connecting to localhost");
})
module.exports =router;
