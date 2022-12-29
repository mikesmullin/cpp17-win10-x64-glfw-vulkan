#pragma once

#include "lve_device.hpp"
#include "lve_pipeline.hpp"
#include "lve_window.hpp"

namespace lve {
class FirstApp {
 public:
  static constexpr int WIDTH = 800;
  static constexpr int HEIGHT = 600;

  void run();

 private:
  LveWindow lveWindow{WIDTH, HEIGHT, "Hello Vulkan!"};
  LveDevice lveDevice{lveWindow};
  LvePipeline lvePipeline{
      lveDevice,
      "resources/shaders/simple_shader.vert.spv",
      "resources/shaders/simple_shader.frag.spv",
      LvePipeline::defaultPipelineConfigInfo(WIDTH, HEIGHT)};
};
}  // namespace lve