/*

Copyright © 2023 Caleb Cushing.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    https://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OFS ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

*/
package com.xenoterracide.ai.wh40k.game;

import java.util.Collections;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import javax.measure.MetricPrefix;
import javax.measure.Quantity;
import javax.measure.Unit;
import javax.measure.quantity.Length;
import tech.units.indriya.unit.Units;

public class GameMap implements Surface {

  private static final Unit<Length> MM = MetricPrefix.MILLI(Units.METRE);
  private final Surface table;
  private final Quantity<Length> length; // usually 30" / 60" / 90"
  private final Quantity<Length> width; // usually 44"

  private final List<List<?>> grid;

  public GameMap(Surface table, Quantity<Length> length, Quantity<Length> width) {
    this.length = Objects.requireNonNull(length.to(MM));
    this.width = Objects.requireNonNull(width.to(MM));
    this.table = Objects.requireNonNull(table);

    if (!(table.length().getValue().intValue() >= length.getValue().intValue())) {
      throw new IllegalArgumentException("table length must be less or equal to table width");
    }

    if (!(table.width().getValue().intValue() >= width.getValue().intValue())) {
      throw new IllegalArgumentException("table width must be less or equal to table width");
    }

    this.grid =
      Stream
        .generate(() -> Stream.generate(() -> null).limit(this.width.getValue().intValue()).collect(Collectors.toList())
        )
        .limit(this.length.getValue().intValue())
        .collect(Collectors.toList());
  }

  List<? extends List<?>> grid() {
    return grid.stream().map(Collections::unmodifiableList).toList();
  }

  public Surface table() {
    return table;
  }

  @Override
  public Quantity<Length> length() {
    return this.length;
  }

  @Override
  public Quantity<Length> width() {
    return this.width;
  }
}
