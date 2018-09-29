/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 * <p>
 * http://www.apache.org/licenses/LICENSE-2.0
 * <p>
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.apache.arrow.flight;

import java.util.List;

import org.apache.arrow.flight.impl.Flight;
import org.apache.arrow.flight.impl.Flight.FlightDescriptor.DescriptorType;

import com.google.common.base.Joiner;
import com.google.common.base.Preconditions;
import com.google.common.collect.ImmutableList;
import com.google.protobuf.ByteString;

public class FlightDescriptor {

  private boolean isCmd;
  private List<String> path;
  private byte[] cmd;

  private FlightDescriptor(boolean isCmd, List<String> path, byte[] cmd) {
    super();
    this.isCmd = isCmd;
    this.path = path;
    this.cmd = cmd;
  }

  public static FlightDescriptor command(byte[] cmd) {
    return new FlightDescriptor(true, null, cmd);
  }

  public static FlightDescriptor path(Iterable<String> path) {
    return new FlightDescriptor(false, ImmutableList.copyOf(path), null);
  }

  public static FlightDescriptor path(String...path) {
    return new FlightDescriptor(false, ImmutableList.copyOf(path), null);
  }

  FlightDescriptor(Flight.FlightDescriptor descriptor) {
    if (descriptor.getType() == DescriptorType.CMD) {
      isCmd = true;
      cmd = descriptor.getCmd().toByteArray();
    } else if (descriptor.getType() == DescriptorType.PATH) {
      isCmd = false;
      path = descriptor.getPathList();
    } else {
      throw new UnsupportedOperationException();
    }
  }

  public boolean isCommand() {
    return isCmd;
  }

  public List<String> getPath() {
    Preconditions.checkArgument(!isCmd);
    return path;
  }

  public byte[] getCommand() {
    Preconditions.checkArgument(isCmd);
    return cmd;
  }

  Flight.FlightDescriptor toProtocol() {
    Flight.FlightDescriptor.Builder b = Flight.FlightDescriptor.newBuilder();

    if (isCmd) {
      return b.setType(DescriptorType.CMD).setCmd(ByteString.copyFrom(cmd)).build();
    }
    return b.setType(DescriptorType.PATH).addAllPath(path).build();
  }

  @Override
  public String toString() {
    if (isCmd) {
      return toHex(cmd);
    } else {
      return Joiner.on('.').join(path);
    }
  }

  private String toHex(byte[] bytes) {
    StringBuilder sb = new StringBuilder();
    for (byte b : bytes) {
      sb.append(String.format("%02X ", b));
    }
    return sb.toString();
  }

  @Override
  public int hashCode() {
    final int prime = 31;
    int result = 1;
    result = prime * result + ((cmd == null) ? 0 : cmd.hashCode());
    result = prime * result + (isCmd ? 1231 : 1237);
    result = prime * result + ((path == null) ? 0 : path.hashCode());
    return result;
  }

  @Override
  public boolean equals(Object obj) {
    if (this == obj) {
      return true;
    }
    if (obj == null) {
      return false;
    }
    if (getClass() != obj.getClass()) {
      return false;
    }
    FlightDescriptor other = (FlightDescriptor) obj;
    if (cmd == null) {
      if (other.cmd != null) {
        return false;
      }
    } else if (!cmd.equals(other.cmd)) {
      return false;
    }
    if (isCmd != other.isCmd) {
      return false;
    }
    if (path == null) {
      if (other.path != null) {
        return false;
      }
    } else if (!path.equals(other.path)) {
      return false;
    }
    return true;
  }


}
