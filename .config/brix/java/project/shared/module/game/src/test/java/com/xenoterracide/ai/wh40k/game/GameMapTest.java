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

import static org.assertj.core.api.Assertions.assertThat;

import java.util.Collection;
import org.junit.jupiter.api.Test;
import systems.uom.common.Imperial;
import tech.units.indriya.quantity.Quantities;

class GameMapTest {

  @Test
  void gridSize() {
    var map = new GameMap(
      new Table(Quantities.getQuantity(6 * 12, Imperial.INCH), Quantities.getQuantity(6 * 12, Imperial.INCH)),
      Quantities.getQuantity(44, Imperial.INCH),
      Quantities.getQuantity(30, Imperial.INCH)
    );

    assertThat(map.grid()).hasSize(1117);
    assertThat(map.grid()).map(Collection::size).containsOnly(762);
  }
}
