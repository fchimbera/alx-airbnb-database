## Relationships between entities

<table border="1" cellpadding="6" cellspacing="0">
  <thead>
    <tr>
      <th>Entity 1</th>
      <th>Relationship</th>
      <th>Entity 2</th>
      <th>Cardinality</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>User</td>
      <td>has many</td>
      <td>Properties</td>
      <td>1 : many (host only)</td>
    </tr>
    <tr>
      <td>User</td>
      <td>makes</td>
      <td>Bookings</td>
      <td>1 : many (guest)</td>
    </tr>
    <tr>
      <td>User</td>
      <td>writes</td>
      <td>Reviews</td>
      <td>1 : many</td>
    </tr>
    <tr>
      <td>User</td>
      <td>sends/receives</td>
      <td>Messages</td>
      <td>many : many (via sender & recipient)</td>
    </tr>
    <tr>
      <td>Property</td>
      <td>has many</td>
      <td>Bookings</td>
      <td>1 : many</td>
    </tr>
    <tr>
      <td>Property</td>
      <td>has many</td>
      <td>Reviews</td>
      <td>1 : many</td>
    </tr>
    <tr>
      <td>Booking</td>
      <td>has one</td>
      <td>Payment</td>
      <td>1 : 1</td>
    </tr>
  </tbody>
</table>

## ER Diagram
