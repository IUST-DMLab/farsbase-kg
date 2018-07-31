var srcContext = "fkg.iust.ac.ir";
var dstContext = "freebase.net";
var newContext = "http://" + dstContext + "/";
var srcReplace = "//" + srcContext;
var dstReplace = "//" + dstContext;
var srcKeyReplace = "//" + srcContext.replace(/\./g, "+++");
var dstKeyReplace = "//" + dstContext.replace(/\./g, "+++");

use KGStore2;
var subjectNumber = 0;
db.subjects.find({}).forEach(function(e,i) {
    print(++subjectNumber + ": " + e.subject);
    e.context= newContext;
    e.subject = e.subject.replace(srcReplace,dstReplace);
    var oldKeys = Object.keys(e.triples);
    var newTriples = {};
    oldKeys.forEach(function(predicate, j) {
        var values = e.triples[predicate];
        values.forEach(function(value, k) {
            value.value = value.value.replace(srcReplace,dstReplace);
            var propertiesKeys = Object.keys(value.properties);
            var newProperties = {};
            propertiesKeys.forEach(function(propertyKey, l) {
                var propertyValue = value.properties[propertyKey];
                propertyValue.value = propertyValue.value.replace(srcReplace,dstReplace);
                newProperties[propertyKey.replace(srcKeyReplace,dstKeyReplace)] = propertyValue;
            });
            value.properties = newProperties;
        });
        newTriples[predicate.replace(srcKeyReplace,dstKeyReplace)] = values;
    });
    e.triples = newTriples;
    db.subjects.save(e);
});

