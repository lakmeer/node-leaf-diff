var leafDiff;
module.exports = leafDiff = function(a, b, chainName, diffs){
  var k, va, vb;
  chainName == null && (chainName = '');
  diffs == null && (diffs = []);
  if (typeof a === 'object' && a) {
    for (k in a) {
      va = a[k];
      vb = b[k];
      leafDiff(va, b[k], chainName + "." + k, diffs);
    }
  } else {
    if (a !== b) {
      diffs.push({
        key: chainName.replace(/^\./, ''),
        old: a,
        'new': b
      });
    }
  }
  return diffs;
};
