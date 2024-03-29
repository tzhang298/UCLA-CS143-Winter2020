package org.apache.spark.graphx.impl;
// no position
public  class ShippableVertexPartition$ implements scala.Serializable {
  /**
   * Static reference to the singleton instance of this Scala object.
   */
  public static final ShippableVertexPartition$ MODULE$ = null;
  public   ShippableVertexPartition$ () { throw new RuntimeException(); }
  /** Construct a `ShippableVertexPartition` from the given vertices without any routing table. */
  public <VD extends java.lang.Object> org.apache.spark.graphx.impl.ShippableVertexPartition<VD> apply (scala.collection.Iterator<scala.Tuple2<java.lang.Object, VD>> iter, scala.reflect.ClassTag<VD> evidence$2) { throw new RuntimeException(); }
  /**
   * Construct a <code>ShippableVertexPartition</code> from the given vertices with the specified routing
   * table, filling in missing vertices mentioned in the routing table using <code>defaultVal</code>.
   */
  public <VD extends java.lang.Object> org.apache.spark.graphx.impl.ShippableVertexPartition<VD> apply (scala.collection.Iterator<scala.Tuple2<java.lang.Object, VD>> iter, org.apache.spark.graphx.impl.RoutingTablePartition routingTable, VD defaultVal, scala.reflect.ClassTag<VD> evidence$3) { throw new RuntimeException(); }
  /**
   * Construct a <code>ShippableVertexPartition</code> from the given vertices with the specified routing
   * table, filling in missing vertices mentioned in the routing table using <code>defaultVal</code>,
   * and merging duplicate vertex atrribute with mergeFunc.
   */
  public <VD extends java.lang.Object> org.apache.spark.graphx.impl.ShippableVertexPartition<VD> apply (scala.collection.Iterator<scala.Tuple2<java.lang.Object, VD>> iter, org.apache.spark.graphx.impl.RoutingTablePartition routingTable, VD defaultVal, scala.Function2<VD, VD, VD> mergeFunc, scala.reflect.ClassTag<VD> evidence$4) { throw new RuntimeException(); }
  /**
   * Implicit conversion to allow invoking <code>VertexPartitionBase</code> operations directly on a
   * <code>ShippableVertexPartition</code>.
   */
  public <VD extends java.lang.Object> org.apache.spark.graphx.impl.ShippableVertexPartitionOps<VD> shippablePartitionToOps (org.apache.spark.graphx.impl.ShippableVertexPartition<VD> partition, scala.reflect.ClassTag<VD> evidence$5) { throw new RuntimeException(); }
}
