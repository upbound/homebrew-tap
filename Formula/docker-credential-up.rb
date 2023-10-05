# frozen_string_literal: true

# Copyright 2022 Upbound Inc
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

class DockerCredentialUp < Formula
  desc 'Upbound Docker credential helper'
  homepage 'https://upbound.io'
  version 'v0.19.2'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.19.2/bundle/docker-credential-up/darwin_amd64.tar.gz'
    sha256 '41935cfff0cd96cd33c35bad1299d415902a60ccda6ce041b04b8dd6de9eac2c'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.19.2/bundle/docker-credential-up/darwin_arm64.tar.gz'
    sha256 '80dedf7b5822f7e04966745bc4bc17fdf54baf59160ad3d57d3985490fc228c9'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.19.2/bundle/docker-credential-up/linux_amd64.tar.gz'
    sha256 '9b687ac6b5fabf283e23a0fe391ff3575015a78471d517cce5891d412db9807d'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.19.2/bundle/docker-credential-up/linux_arm.tar.gz'
    sha256 '50daed84badead00eb0f24176dc27845f8a4b6fac2cd3c602ac4a92507528285'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.19.2/bundle/docker-credential-up/linux_arm64.tar.gz'
    sha256 '790be28533f14e039e2efafa1041fceb82a245e2282e9ce42179e144faf21cc2'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
