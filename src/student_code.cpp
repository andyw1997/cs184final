#include "student_code.h"
#include "mutablePriorityQueue.h"

using namespace std;

namespace CGL
{
  void BezierCurve::evaluateStep()
  {
    // TODO Part 1.
    // Perform one step of the Bezier curve's evaluation at t using de Casteljau's algorithm for subdivision.
    // Store all of the intermediate control points into the 2D vector evaluatedLevels.
    std::vector<Vector2D> lastLevel = evaluatedLevels[evaluatedLevels.size() - 1];
    std::vector<Vector2D> currLevel;
    for (int i = 0; i < lastLevel.size() - 1; i++) {
        currLevel.push_back(lastLevel[i] * (1 - t) + lastLevel[i + 1] * t);
    }
    evaluatedLevels.push_back(currLevel);
  }


  Vector3D BezierPatch::evaluate(double u, double v) const
  {
    // TODO Part 2.
    // Evaluate the Bezier surface at parameters (u, v) through 2D de Casteljau subdivision.
    // (i.e. Unlike Part 1 where we performed one subdivision level per call to evaluateStep, this function
    // should apply de Casteljau's algorithm until it computes the final, evaluated point on the surface)
    std::vector<Vector3D> points;
    points.push_back(evaluate1D(controlPoints[0], u));
    points.push_back(evaluate1D(controlPoints[1], u));
    points.push_back(evaluate1D(controlPoints[2], u));
    points.push_back(evaluate1D(controlPoints[3], u));
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3 - i; j++) {
            points[j] = points[j] * (1 - v) + points[j + 1] * v;
        }
    }
    return points[0];
  }

  Vector3D BezierPatch::evaluate1D(std::vector<Vector3D> points, double t) const
  {
    // TODO Part 2.
    // Optional helper function that you might find useful to implement as an abstraction when implementing BezierPatch::evaluate.
    // Given an array of 4 points that lie on a single curve, evaluates the Bezier curve at parameter t using 1D de Casteljau subdivision.
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3 - i; j++) {
            points[j] = points[j] * (1 - t) + points[j + 1] * t;
        }
    }
    return points[0];
 }



  Vector3D Vertex::normal( void ) const
  {
    // TODO Part 3.
    // TODO Returns an approximate unit normal at this vertex, computed by
    // TODO taking the area-weighted average of the normals of neighboring
    // TODO triangles, then normalizing.
    Vector3D n(0,0,0);
    HalfedgeCIter curr = halfedge();
    HalfedgeCIter orig = halfedge();
    do{
        Vector3D v1 = curr->vertex()->position;
        curr = curr->twin();
        Vector3D v2 = curr->vertex()->position;
        curr = curr->next();
        Vector3D v3 = curr->next()->vertex()->position;
        v2 = v2 - v1;
        v3 = v3 - v1;
        n -= cross(v2, v3);
    } while (curr != orig);
    return n.unit();
  }

  EdgeIter HalfedgeMesh::flipEdge( EdgeIter e0 )
  {
    // TODO Part 4.
    // TODO This method should flip the given edge and return an iterator to the flipped edge.
      HalfedgeIter h0 = e0->halfedge();
      HalfedgeIter h1 = h0->next();
      HalfedgeIter h2 = h1->next();
      HalfedgeIter h3 = h0->twin();
      HalfedgeIter h4 = h3->next();
      HalfedgeIter h5 = h4->next();
      HalfedgeIter h6 = h1->twin();
      HalfedgeIter h7 = h2->twin();
      HalfedgeIter h8 = h4->twin();
      HalfedgeIter h9 = h5->twin();

      VertexIter v0 = h0->vertex();
      VertexIter v1 = h3->vertex();
      VertexIter v2 = h6->vertex();
      VertexIter v3 = h8->vertex();

      EdgeIter e1 = h1->edge();
      EdgeIter e2 = h2->edge();
      EdgeIter e3 = h4->edge();
      EdgeIter e4 = h5->edge();

      FaceIter f0 = h0-> face();
      FaceIter f1 = h3->face();

      h0->next() = h1;
      h0->twin() = h3;
      h0->vertex() = v3;
      h0->edge() = e0;
      h0->face() = f0;

      h1->next() = h2;
      h1->twin() = h7;
      h1->vertex() = v2;
      h1->edge() = e2;
      h1->face() = f0;

      h2->next() = h0;
      h2->twin() = h8;
      h2->vertex() = v0;
      h2->edge() = e3;
      h2->face() = f0;

      h3->next() = h4;
      h3->twin() = h0;
      h3->vertex() = v2;
      h3->edge() = e0;
      h3->face() = f1;

      h4->next() = h5;
      h4->twin() = h9;
      h4->vertex() = v3;
      h4->edge() = e4;
      h4->face() = f1;

      h5->next() = h3;
      h5->twin() = h6;
      h5->vertex() = v1;
      h5->edge() = e1;
      h5->face() = f1;

      h6->twin() = h5;
      h7->twin() = h1;
      h8->twin() = h2;
      h9->twin() = h4;

      v0->halfedge() = h2;
      v1->halfedge() = h9;
      v2->halfedge() = h6;
      v3->halfedge() = h8;

      e0->halfedge() = h3;
      e1->halfedge() = h5;
      e2->halfedge() = h1;
      e3->halfedge() = h2;
      e4->halfedge() = h4;

      f0->halfedge() = h0;
      f1->halfedge() = h3;
    return e0;
  }

  VertexIter HalfedgeMesh::splitEdge( EdgeIter e0 )
  {
    // TODO Part 5.
    // TODO This method should split the given edge and return an iterator to the newly inserted vertex.
    // TODO The halfedge of this vertex should point along the edge that was split, rather than the new edges.
      HalfedgeIter h0 = e0->halfedge();
      HalfedgeIter h1 = h0->next();
      HalfedgeIter h2 = h1->next();
      HalfedgeIter h3 = h0->twin();
      HalfedgeIter h4 = h3->next();
      HalfedgeIter h5 = h4->next();
      HalfedgeIter h6 = h1->twin();
      HalfedgeIter h7 = h2->twin();
      HalfedgeIter h8 = h4->twin();
      HalfedgeIter h9 = h5->twin();
      HalfedgeIter h10 = newHalfedge();
      HalfedgeIter h11 = newHalfedge();
      HalfedgeIter h12 = newHalfedge();
      HalfedgeIter h13 = newHalfedge();
      HalfedgeIter h14 = newHalfedge();
      HalfedgeIter h15 = newHalfedge();

      VertexIter v0 = h0->vertex();
      VertexIter v1 = h3->vertex();
      VertexIter v2 = h6->vertex();
      VertexIter v3 = h8->vertex();
      VertexIter v4 = newVertex();
      v4->isNew = true;

      EdgeIter e1 = h1->edge();
      EdgeIter e2 = h2->edge();
      EdgeIter e3 = h4->edge();
      EdgeIter e4 = h5->edge();
      EdgeIter e5 = newEdge();
      EdgeIter e6 = newEdge();
      EdgeIter e7 = newEdge();
      e5->isNew = true;
      e7->isNew = true;
      e6->isNew = false;

      FaceIter f0 = h0-> face();
      FaceIter f1 = h3->face();
      FaceIter f2 = newFace();
      FaceIter f3 = newFace();

      v0->halfedge() = h5;
      v1->halfedge() = h1;
      v2->halfedge() = h4;
      v3->halfedge() = h11;
      v4->halfedge() = h3;

      e0->halfedge() = h0;
      e1->halfedge() = h6;
      e2->halfedge() = h4;
      e3->halfedge() = h12;
      e4->halfedge() = h9;
      e5->halfedge() = h11;
      e6->halfedge() = h10;
      e7->halfedge() = h3;

      f0->halfedge() = h0;
      f1->halfedge() = h13;
      f2->halfedge() = h10;
      f3->halfedge() = h3;

      h0->next() = h1;
      h0->twin() = h14;
      h0->vertex() = v4;
      h0->edge() = e0;
      h0->face() = f0;

      h1->next() = h2;
      h1->twin() = h6;
      h1->vertex() = v1;
      h1->edge() = e1;
      h1->face() = f0;

      h2->next() = h0;
      h2->twin() = h3;
      h2->vertex() = v2;
      h2->edge() = e7;
      h2->face() = f0;

      h3->next() = h4;
      h3->twin() = h2;
      h3->vertex() = v4;
      h3->edge() = e7;
      h3->face() = f3;

      h4->next() = h5;
      h4->twin() = h7;
      h4->vertex() = v2;
      h4->edge() = e2;
      h4->face() = f3;

      h5->next() = h3;
      h5->twin() = h10;
      h5->vertex() = v0;
      h5->edge() = e6;
      h5->face() = f3;

      h6->twin() = h1;
      h7->twin() = h4;
      h8->twin() = h12;
      h9->twin() = h15;

      h10->next() = h12;
      h10->twin() = h5;
      h10->vertex() = v4;
      h10->edge() = e6;
      h10->face() = f2;

      h11->next() = h10;
      h11->twin() = h13;
      h11->vertex() = v3;
      h11->edge() = e5;
      h11->face() = f2;

      h12->next() = h11;
      h12->twin() = h8;
      h12->vertex() = v0;
      h12->edge() = e3;
      h12->face() = f2;

      h13->next() = h15;
      h13->twin() = h11;
      h13->vertex() = v4;
      h13->edge() = e5;
      h13->face() = f1;

      h14->next() = h13;
      h14->twin() = h0;
      h14->vertex() = v1;
      h14->edge() = e0;
      h14->face() = f1;

      h15->next() = h14;
      h15->twin() = h9;
      h15->vertex() = v3;
      h15->edge() = e4;
      h15->face() = f1;

      v4->position = v0->position + ((v1->position - v0->position) / 2);

    return v4;
  }



  void MeshResampler::upsample( HalfedgeMesh& mesh )
  {
    // TODO Part 6.
    // This routine should increase the number of triangles in the mesh using Loop subdivision.
    // Each vertex and edge of the original surface can be associated with a vertex in the new (subdivided) surface.
    // Therefore, our strategy for computing the subdivided vertex locations is to *first* compute the new positions
    // using the connectity of the original (coarse) mesh; navigating this mesh will be much easier than navigating
    // the new subdivided (fine) mesh, which has more elements to traverse. We will then assign vertex positions in
    // the new mesh based on the values we computed for the original mesh.

    for (VertexIter v = mesh.verticesBegin(); v != mesh.verticesEnd(); v++) {
        v->isNew = false;

        int n = 0;
        Vector3D sumPos(0, 0, 0);
        HalfedgeIter curr = v->halfedge();
        HalfedgeIter orig = v->halfedge();
        do {
            curr = curr->twin();
            VertexIter neighbor = curr->vertex();
            sumPos += neighbor->position;
            n += 1;
            curr = curr->next();
        } while (curr != orig);

        double u = 3.0/16;
        if (n != 3) {
            u = 3.0/(8*n);
        }
        v->newPosition = ((1-n*u)*v->position) + (u*sumPos);
    }

    std::vector<EdgeIter> oldEdges;
    for (EdgeIter e = mesh.edgesBegin(); e != mesh.edgesEnd(); e++) {
        e->isNew = false;

        Vector3D close = e->halfedge()->vertex()->position + e->halfedge()->twin()->vertex()->position;
        Vector3D far = e->halfedge()->next()->next()->vertex()->position + e->halfedge()->twin()->next()->next()->vertex()->position;
        e->newPosition = (3.0/8)*close + (1.0/8)*far;

        oldEdges.push_back(e);
    }

    for (int i = 0; i < oldEdges.size(); i++) {
        VertexIter v = mesh.splitEdge(oldEdges[i]);
        v->newPosition = oldEdges[i]->newPosition;
    }

    for (EdgeIter e = mesh.edgesBegin(); e != mesh.edgesEnd(); e++) {
        if (e->isNew) {
            VertexIter v1 = e->halfedge()->vertex();
            VertexIter v2 = e->halfedge()->twin()->vertex();
            if ((v1->isNew && !v2->isNew) || (!v1->isNew && v2->isNew)) {
                mesh.flipEdge(e);
            }
        }
    }

    for (VertexIter v = mesh.verticesBegin(); v != mesh.verticesEnd(); v++) {
        v->position = v->newPosition;
    }


    // TODO Compute new positions for all the vertices in the input mesh, using the Loop subdivision rule,
    // TODO and store them in Vertex::newPosition. At this point, we also want to mark each vertex as being
    // TODO a vertex of the original mesh.


    // TODO Next, compute the updated vertex positions associated with edges, and store it in Edge::newPosition.


    // TODO Next, we're going to split every edge in the mesh, in any order.  For future
    // TODO reference, we're also going to store some information about which subdivided
    // TODO edges come from splitting an edge in the original mesh, and which edges are new,
    // TODO by setting the flat Edge::isNew.  Note that in this loop, we only want to iterate
    // TODO over edges of the original mesh---otherwise, we'll end up splitting edges that we
    // TODO just split (and the loop will never end!)


    // TODO Now flip any new edge that connects an old and new vertex.


    // TODO Finally, copy the new vertex positions into final Vertex::position.

    return;
  }
}
