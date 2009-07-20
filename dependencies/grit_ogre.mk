#Gets the name of this Makefile.  Puts it into the variable THISFILE.
THISFILE:=$(lastword $(MAKEFILE_LIST))

################################################################################
### configure these:
################################################################################

#choose a compiler
#COMPILER=g++
COMPILER=grc -es g++ #i use this to colorise output

#choose a GUI library
GUI=-DOGRE_GUI_GLX
#GUI=-DOGRE_GUI_GTK
#GUI=-DOGRE_GUI_WIN32

#choose an endian
ENDIAN=-DOGRE_CONFIG_LITTLE_ENDIAN
#ENDIAN=-DOGRE_CONFIG_BIG_ENDIAN

#do you want Ogre::Real to be double or just float
PRECISION=-DOGRE_DOUBLE_PRECISION=0

#use devil (off by default because it's not free)
DEVIL=-DOGRE_NO_DEVIL=1

#use freeimage (on by default because devil is off, and we need *something*)
FREEIMAGE=-DOGRE_NO_FREEIMAGE=0

#don't use nedmalloc
ALLOCATOR=-DOGRE_MEMORY_ALLOCATOR=1

#version code
VERSION=-DVERSION=1.6.0_grit

#general compiler flags - note optimisation flags, and architecture
OPT=-DNDEBUG -O3
DBG=
CFLAGS=-g -ffast-math -march=pentium4 -Wno-deprecated -Wfatal-errors $(shell pkg-config --cflags freetype2)



NEW_OBJ_DIR=grit_ogre_obj


################################################################################
### no need to fiddle with these:
################################################################################

#yacc stuff
YACC=-DYY_NEVER_INTERACTIVE -DYY_NO_UNPUT


INCLUDE_DIRS=-IOgreMain/include \
             -IOgreMain/src/nedmalloc \
             -IRenderSystems/GL/src/GLX \
             -IRenderSystems/GL/src/nvparse \
             -IRenderSystems/GL/src/atifs/include \
             -IRenderSystems/GL/src/GLSL/include \
             -IRenderSystems/GL/include \
             -IRenderSystems/GL/include/GLX \
             -IPlugIns/CgProgramManager/include \
             -IPlugIns/ParticleFX/include \
             -IPlugIns/OctreeSceneManager/include


CFLAGS+=$(GUI) $(ENDIAN) $(PRECISION) $(DEVIL) $(FREEIMAGE) $(ALLOCATOR) $(VERSION) $(YACC) $(INCLUDE_DIRS)



################################################################################
### now the various groups of source code files
################################################################################

CORE_SOURCE=OgreMain/src/OgreAlignedAllocator.cpp \
            OgreMain/src/OgreAnimable.cpp \
            OgreMain/src/OgreAnimation.cpp \
            OgreMain/src/OgreAnimationState.cpp \
            OgreMain/src/OgreAnimationTrack.cpp \
            OgreMain/src/OgreArchiveManager.cpp \
            OgreMain/src/OgreAutoParamDataSource.cpp \
            OgreMain/src/OgreBillboardChain.cpp \
            OgreMain/src/OgreBillboard.cpp \
            OgreMain/src/OgreBillboardParticleRenderer.cpp \
            OgreMain/src/OgreBillboardSet.cpp \
            OgreMain/src/OgreBone.cpp \
            OgreMain/src/OgreBorderPanelOverlayElement.cpp \
            OgreMain/src/OgreCamera.cpp \
            OgreMain/src/OgreCodec.cpp \
            OgreMain/src/OgreColourValue.cpp \
            OgreMain/src/OgreCommon.cpp \
            OgreMain/src/OgreCompiler2Pass.cpp \
            OgreMain/src/OgreCompositionPass.cpp \
            OgreMain/src/OgreCompositionTargetPass.cpp \
            OgreMain/src/OgreCompositionTechnique.cpp \
            OgreMain/src/OgreCompositorChain.cpp \
            OgreMain/src/OgreCompositor.cpp \
            OgreMain/src/OgreCompositorInstance.cpp \
            OgreMain/src/OgreCompositorManager.cpp \
            OgreMain/src/OgreCompositorScriptCompiler.cpp \
            OgreMain/src/OgreCompositorSerializer.cpp \
            OgreMain/src/OgreConfigFile.cpp \
            OgreMain/src/OgreControllerManager.cpp \
            OgreMain/src/OgreConvexBody.cpp \
            OgreMain/src/OgreDataStream.cpp \
            OgreMain/src/OgreDDSCodec.cpp \
            OgreMain/src/OgreDefaultHardwareBufferManager.cpp \
            OgreMain/src/OgreDefaultSceneQueries.cpp \
            OgreMain/src/OgreDistanceLodStrategy.cpp \
            OgreMain/src/OgreDynLib.cpp \
            OgreMain/src/OgreDynLibManager.cpp \
            OgreMain/src/OgreEdgeListBuilder.cpp \
            OgreMain/src/OgreEntity.cpp \
            OgreMain/src/OgreException.cpp \
            OgreMain/src/OgreExternalTextureSource.cpp \
            OgreMain/src/OgreExternalTextureSourceManager.cpp \
            OgreMain/src/OgreFileSystem.cpp \
            OgreMain/src/OgreFont.cpp \
            OgreMain/src/OgreFontManager.cpp \
            OgreMain/src/OgreFreeImageCodec.cpp \
            OgreMain/src/OgreFrustum.cpp \
            OgreMain/src/OgreGpuProgram.cpp \
            OgreMain/src/OgreGpuProgramManager.cpp \
            OgreMain/src/OgreGpuProgramUsage.cpp \
            OgreMain/src/OgreGpuProgramParams.cpp \
            OgreMain/src/OgreHardwareBufferManager.cpp \
            OgreMain/src/OgreHardwareIndexBuffer.cpp \
            OgreMain/src/OgreHardwareOcclusionQuery.cpp \
            OgreMain/src/OgreHardwarePixelBuffer.cpp \
            OgreMain/src/OgreHardwareVertexBuffer.cpp \
            OgreMain/src/OgreHighLevelGpuProgram.cpp \
            OgreMain/src/OgreHighLevelGpuProgramManager.cpp \
            OgreMain/src/OgreImage.cpp \
            OgreMain/src/OgreInstancedGeometry.cpp \
            OgreMain/src/OgreKeyFrame.cpp \
            OgreMain/src/OgreLight.cpp \
            OgreMain/src/OgreLodStrategy.cpp \
            OgreMain/src/OgreLodStrategyManager.cpp \
            OgreMain/src/OgreLog.cpp \
            OgreMain/src/OgreLogManager.cpp \
            OgreMain/src/OgreManualObject.cpp \
            OgreMain/src/OgreMaterial.cpp \
            OgreMain/src/OgreMaterialManager.cpp \
            OgreMain/src/OgreMaterialSerializer.cpp \
            OgreMain/src/OgreMath.cpp \
            OgreMain/src/OgreMatrix3.cpp \
            OgreMain/src/OgreMatrix4.cpp \
            OgreMain/src/OgreMemoryAllocatedObject.cpp \
            OgreMain/src/OgreMemoryNedAlloc.cpp \
            OgreMain/src/OgreMesh.cpp \
            OgreMain/src/OgreMeshManager.cpp \
            OgreMain/src/OgreMeshSerializer.cpp \
            OgreMain/src/OgreMeshSerializerImpl.cpp \
            OgreMain/src/OgreMovableObject.cpp \
            OgreMain/src/OgreMovablePlane.cpp \
            OgreMain/src/OgreNode.cpp \
            OgreMain/src/OgreNumerics.cpp \
            OgreMain/src/OgreOptimisedUtil.cpp \
            OgreMain/src/OgreOptimisedUtilGeneral.cpp \
            OgreMain/src/OgreOptimisedUtilSSE.cpp \
            OgreMain/src/OgreOverlayContainer.cpp \
            OgreMain/src/OgreOverlay.cpp \
            OgreMain/src/OgreOverlayElementCommands.cpp \
            OgreMain/src/OgreOverlayElement.cpp \
            OgreMain/src/OgreOverlayManager.cpp \
            OgreMain/src/OgrePanelOverlayElement.cpp \
            OgreMain/src/OgreParticle.cpp \
            OgreMain/src/OgreParticleEmitterCommands.cpp \
            OgreMain/src/OgreParticleEmitter.cpp \
            OgreMain/src/OgreParticleIterator.cpp \
            OgreMain/src/OgreParticleSystem.cpp \
            OgreMain/src/OgreParticleSystemManager.cpp \
            OgreMain/src/OgrePass.cpp \
            OgreMain/src/OgrePatchMesh.cpp \
            OgreMain/src/OgrePatchSurface.cpp \
            OgreMain/src/OgrePixelCountLodStrategy.cpp \
            OgreMain/src/OgrePixelFormat.cpp \
            OgreMain/src/OgrePlane.cpp \
            OgreMain/src/OgrePlatformInformation.cpp \
            OgreMain/src/OgrePolygon.cpp \
            OgreMain/src/OgrePose.cpp \
            OgreMain/src/OgrePrecompiledHeaders.cpp \
            OgreMain/src/OgrePredefinedControllers.cpp \
            OgreMain/src/OgrePrefabFactory.cpp \
            OgreMain/src/OgreProfiler.cpp \
            OgreMain/src/OgreProgressiveMesh.cpp \
            OgreMain/src/OgreQuaternion.cpp \
            OgreMain/src/OgreRectangle2D.cpp \
            OgreMain/src/OgreRenderQueue.cpp \
            OgreMain/src/OgreRenderQueueInvocation.cpp \
            OgreMain/src/OgreRenderQueueSortingGrouping.cpp \
            OgreMain/src/OgreRenderSystemCapabilities.cpp \
            OgreMain/src/OgreRenderSystemCapabilitiesManager.cpp \
            OgreMain/src/OgreRenderSystemCapabilitiesSerializer.cpp \
            OgreMain/src/OgreRenderSystem.cpp \
            OgreMain/src/OgreRenderTarget.cpp \
            OgreMain/src/OgreRenderTexture.cpp \
            OgreMain/src/OgreRenderToVertexBuffer.cpp \
            OgreMain/src/OgreRenderWindow.cpp \
            OgreMain/src/OgreResourceBackgroundQueue.cpp \
            OgreMain/src/OgreResource.cpp \
            OgreMain/src/OgreResourceGroupManager.cpp \
            OgreMain/src/OgreResourceManager.cpp \
            OgreMain/src/OgreRibbonTrail.cpp \
            OgreMain/src/OgreRoot.cpp \
            OgreMain/src/OgreRotationSpline.cpp \
            OgreMain/src/OgreSceneManager.cpp \
            OgreMain/src/OgreSceneManagerEnumerator.cpp \
            OgreMain/src/OgreSceneNode.cpp \
            OgreMain/src/OgreSceneQuery.cpp \
            OgreMain/src/OgreScriptCompiler.cpp \
            OgreMain/src/OgreScriptLexer.cpp \
            OgreMain/src/OgreScriptParser.cpp \
            OgreMain/src/OgreScriptTranslator.cpp \
            OgreMain/src/OgreSearchOps.cpp \
            OgreMain/src/OgreSerializer.cpp \
            OgreMain/src/OgreShadowCameraSetup.cpp \
            OgreMain/src/OgreShadowCameraSetupFocused.cpp \
            OgreMain/src/OgreShadowCameraSetupLiSPSM.cpp \
            OgreMain/src/OgreShadowCameraSetupPlaneOptimal.cpp \
            OgreMain/src/OgreShadowCameraSetupPSSM.cpp \
            OgreMain/src/OgreShadowCaster.cpp \
            OgreMain/src/OgreShadowTextureManager.cpp \
            OgreMain/src/OgreShadowVolumeExtrudeProgram.cpp \
            OgreMain/src/OgreSimpleRenderable.cpp \
            OgreMain/src/OgreSimpleSpline.cpp \
            OgreMain/src/OgreSkeleton.cpp \
            OgreMain/src/OgreSkeletonInstance.cpp \
            OgreMain/src/OgreSkeletonManager.cpp \
            OgreMain/src/OgreSkeletonSerializer.cpp \
            OgreMain/src/OgreStaticGeometry.cpp \
            OgreMain/src/OgreStringConverter.cpp \
            OgreMain/src/OgreString.cpp \
            OgreMain/src/OgreStringInterface.cpp \
            OgreMain/src/OgreSubEntity.cpp \
            OgreMain/src/OgreSubMesh.cpp \
            OgreMain/src/OgreTagPoint.cpp \
            OgreMain/src/OgreTangentSpaceCalc.cpp \
            OgreMain/src/OgreTechnique.cpp \
            OgreMain/src/OgreTextAreaOverlayElement.cpp \
            OgreMain/src/OgreTexture.cpp \
            OgreMain/src/OgreTextureManager.cpp \
            OgreMain/src/OgreTextureUnitState.cpp \
            OgreMain/src/OgreUnifiedHighLevelGpuProgram.cpp \
            OgreMain/src/OgreUserDefinedObject.cpp \
            OgreMain/src/OgreVector2.cpp \
            OgreMain/src/OgreVector3.cpp \
            OgreMain/src/OgreVector4.cpp \
            OgreMain/src/OgreVertexIndexData.cpp \
            OgreMain/src/OgreViewport.cpp \
            OgreMain/src/OgreWorkQueue.cpp \
            OgreMain/src/OgreWindowEventUtilities.cpp \
            OgreMain/src/OgreWireBoundingBox.cpp \
            OgreMain/src/OgreZip.cpp

DEVIL_SOURCE=OgreMain/src/OgreILCodecs.cpp \
             OgreMain/src/OgreILImageCodec.cpp \
             OgreMain/src/OgreILUtil.cpp

GL_SOURCE=RenderSystems/GL/src/glew.cpp \
          RenderSystems/GL/src/OgreGLATIFSInit.cpp \
          RenderSystems/GL/src/OgreGLContext.cpp \
          RenderSystems/GL/src/OgreGLDefaultHardwareBufferManager.cpp \
          RenderSystems/GL/src/OgreGLFBOMultiRenderTarget.cpp \
          RenderSystems/GL/src/OgreGLFBORenderTexture.cpp \
          RenderSystems/GL/src/OgreGLFrameBufferObject.cpp \
          RenderSystems/GL/src/OgreGLGpuNvparseProgram.cpp \
          RenderSystems/GL/src/OgreGLGpuProgram.cpp \
          RenderSystems/GL/src/OgreGLGpuProgramManager.cpp \
          RenderSystems/GL/src/OgreGLHardwareBufferManager.cpp \
          RenderSystems/GL/src/OgreGLHardwareIndexBuffer.cpp \
          RenderSystems/GL/src/OgreGLHardwareOcclusionQuery.cpp \
          RenderSystems/GL/src/OgreGLHardwarePixelBuffer.cpp \
          RenderSystems/GL/src/OgreGLHardwareVertexBuffer.cpp \
          RenderSystems/GL/src/OgreGLPBRenderTexture.cpp \
          RenderSystems/GL/src/OgreGLPixelFormat.cpp \
          RenderSystems/GL/src/OgreGLPlugin.cpp \
          RenderSystems/GL/src/OgreGLRenderSystem.cpp \
          RenderSystems/GL/src/OgreGLRenderTexture.cpp \
          RenderSystems/GL/src/OgreGLRenderToVertexBuffer.cpp \
          RenderSystems/GL/src/OgreGLSupport.cpp \
          RenderSystems/GL/src/OgreGLTexture.cpp \
          RenderSystems/GL/src/OgreGLTextureManager.cpp \
          RenderSystems/GL/src/nvparse/avp1.0_impl.cpp \
          RenderSystems/GL/src/nvparse/nvparse.cpp \
          RenderSystems/GL/src/nvparse/nvparse_errors.cpp \
          RenderSystems/GL/src/nvparse/_ps1.0_lexer.cpp \
          RenderSystems/GL/src/nvparse/_ps1.0_parser.cpp \
          RenderSystems/GL/src/nvparse/ps1.0_program.cpp \
          RenderSystems/GL/src/nvparse/rc1.0_combiners.cpp \
          RenderSystems/GL/src/nvparse/rc1.0_final.cpp \
          RenderSystems/GL/src/nvparse/rc1.0_general.cpp \
          RenderSystems/GL/src/nvparse/_rc1.0_lexer.cpp \
          RenderSystems/GL/src/nvparse/_rc1.0_parser.cpp \
          RenderSystems/GL/src/nvparse/ts1.0_inst.cpp \
          RenderSystems/GL/src/nvparse/ts1.0_inst_list.cpp \
          RenderSystems/GL/src/nvparse/_ts1.0_lexer.cpp \
          RenderSystems/GL/src/nvparse/_ts1.0_parser.cpp \
          RenderSystems/GL/src/nvparse/vcp1.0_impl.cpp \
          RenderSystems/GL/src/nvparse/vp1.0_impl.cpp \
          RenderSystems/GL/src/nvparse/vs1.0_inst.cpp \
          RenderSystems/GL/src/nvparse/vs1.0_inst_list.cpp \
          RenderSystems/GL/src/nvparse/_vs1.0_lexer.cpp \
          RenderSystems/GL/src/nvparse/_vs1.0_parser.cpp \
          RenderSystems/GL/src/nvparse/vsp1.0_impl.cpp \
          RenderSystems/GL/src/GLSL/src/OgreGLSLExtSupport.cpp \
          RenderSystems/GL/src/GLSL/src/OgreGLSLGpuProgram.cpp \
          RenderSystems/GL/src/GLSL/src/OgreGLSLLinkProgram.cpp \
          RenderSystems/GL/src/GLSL/src/OgreGLSLLinkProgramManager.cpp \
          RenderSystems/GL/src/GLSL/src/OgreGLSLPreprocessor.cpp \
          RenderSystems/GL/src/GLSL/src/OgreGLSLProgram.cpp \
          RenderSystems/GL/src/GLSL/src/OgreGLSLProgramFactory.cpp \
          RenderSystems/GL/src/atifs/src/ATI_FS_GLGpuProgram.cpp \
          RenderSystems/GL/src/atifs/src/Compiler2Pass.cpp \
          RenderSystems/GL/src/atifs/src/ps_1_4.cpp


CG_SOURCE=PlugIns/CgProgramManager/src/OgreCgPlugin.cpp \
          PlugIns/CgProgramManager/src/OgreCgProgram.cpp \
          PlugIns/CgProgramManager/src/OgreCgProgramFactory.cpp


PARTICLEFX_SOURCE=PlugIns/ParticleFX/src/OgreAreaEmitter.cpp \
                  PlugIns/ParticleFX/src/OgreBoxEmitter.cpp \
                  PlugIns/ParticleFX/src/OgreColourFaderAffector2.cpp \
                  PlugIns/ParticleFX/src/OgreColourFaderAffector.cpp \
                  PlugIns/ParticleFX/src/OgreColourImageAffector.cpp \
                  PlugIns/ParticleFX/src/OgreColourInterpolatorAffector.cpp \
                  PlugIns/ParticleFX/src/OgreCylinderEmitter.cpp \
                  PlugIns/ParticleFX/src/OgreDeflectorPlaneAffector.cpp \
                  PlugIns/ParticleFX/src/OgreDirectionRandomiserAffector.cpp \
                  PlugIns/ParticleFX/src/OgreEllipsoidEmitter.cpp \
                  PlugIns/ParticleFX/src/OgreHollowEllipsoidEmitter.cpp \
                  PlugIns/ParticleFX/src/OgreLinearForceAffector.cpp \
                  PlugIns/ParticleFX/src/OgreParticleFXPlugin.cpp \
                  PlugIns/ParticleFX/src/OgrePointEmitter.cpp \
                  PlugIns/ParticleFX/src/OgreRingEmitter.cpp \
                  PlugIns/ParticleFX/src/OgreRotationAffector.cpp \
                  PlugIns/ParticleFX/src/OgreScaleAffector.cpp


OCTREE_SOURCE=PlugIns/OctreeSceneManager/src/OgreHeightmapTerrainPageSource.cpp \
              PlugIns/OctreeSceneManager/src/OgreOctreeCamera.cpp \
              PlugIns/OctreeSceneManager/src/OgreOctree.cpp \
              PlugIns/OctreeSceneManager/src/OgreOctreeNode.cpp \
              PlugIns/OctreeSceneManager/src/OgreOctreePlugin.cpp \
              PlugIns/OctreeSceneManager/src/OgreOctreeSceneManager.cpp \
              PlugIns/OctreeSceneManager/src/OgreOctreeSceneQuery.cpp \
              PlugIns/OctreeSceneManager/src/OgreTerrainPage.cpp \
              PlugIns/OctreeSceneManager/src/OgreTerrainPageSource.cpp \
              PlugIns/OctreeSceneManager/src/OgreTerrainRenderable.cpp \
              PlugIns/OctreeSceneManager/src/OgreTerrainSceneManager.cpp \
              PlugIns/OctreeSceneManager/src/OgreTerrainVertexProgram.cpp



################################################################################
### glx specific stuff
################################################################################

POSIX_TIMER_SOURCE=OgreMain/src/GLX/OgreTimer.cpp

CONFIG_GTK_SOURCE=OgreMain/src/gtk/OgreConfigDialog.cpp \
                  OgreMain/src/gtk/OgreErrorDialog.cpp

CONFIG_GLX_SOURCE=OgreMain/src/GLX/OgreConfigDialog.cpp \
                  OgreMain/src/GLX/OgreErrorDialog.cpp

GL_GLX_SOURCE=RenderSystems/GL/src/GLX/OgreGLXContext.cpp \
              RenderSystems/GL/src/GLX/OgreGLXGLSupport.cpp \
              RenderSystems/GL/src/GLX/OgreGLXRenderTexture.cpp \
              RenderSystems/GL/src/GLX/OgreGLXWindow.cpp



################################################################################
### win32 specific stuff
################################################################################

GL_WIN32_SOURCE=RenderSystems/GL/src/OgreGLEngineDll.cpp \
                RenderSystems/GL/src/OgreWin32GLSupport.cpp \
                RenderSystems/GL/src/OgreWin32RenderTexture.cpp \
                RenderSystems/GL/src/OgreWin32Window.cpp


CG_WIN32_SOURCE=PlugIns/CgProgramManager/src/OgreCgProgramManagerDll.cpp


PARTICLEFX_WIN32_SOURCE= PlugIns/ParticleFX/src/OgreParticleFX.cpp


OCTREE_WIN32_SOURCE=PlugIns/OctreeSceneManager/src/OgreOctreeSceneManagerDll.cpp



################################################################################
### now the actual compile
################################################################################

ALL_SOURCE=$(CORE_SOURCE) $(GL_SOURCE) $(PARTICLEFX_SOURCE) $(OCTREE_SOURCE)
# $(CG_SOURCE) $(CG_WIN32_SOURCE)
ALL_SOURCE+=$(POSIX_TIMER_SOURCE) $(CONFIG_GLX_SOURCE) $(GL_GLX_SOURCE) $(OCTREE_GLX_SOURCE)

$(NEW_OBJ_DIR)/opt/semithreaded/%.o: %.cpp
	@mkdir -p `dirname "$@"`
	@echo "Compiling (optimised): \"$@\""
	@$(COMPILER) $(CFLAGS) $(OPT) -DOGRE_THREAD_SUPPORT=2 -c "$<" -o "$@"

$(NEW_OBJ_DIR)/dbg/semithreaded/%.o: %.cpp
	@mkdir -p `dirname "$@"`
	@echo "Compiling (debug): \"$@\""
	@$(COMPILER) $(CFLAGS) $(DBG) -DOGRE_THREAD_SUPPORT=2 -c "$<" -o "$@"



# create the files in $(ALL_SOURCE) where *.cpp is replaced with $(NEW_OBJ_DIR)/opt/semithreaded/*.o
$(NEW_OBJ_DIR)/opt/libogre_semithreaded.a: $(patsubst %.cpp,$(NEW_OBJ_DIR)/opt/semithreaded/%.o,$(ALL_SOURCE))
	@rm -f $@
	@ar rs $@ $^

# create the files in $(ALL_SOURCE) where *.cpp is replaced with $(NEW_OBJ_DIR)/dbg/semithreaded/*.o
$(NEW_OBJ_DIR)/dbg/libogre_semithreaded.a: $(patsubst %.cpp,$(NEW_OBJ_DIR)/dbg/semithreaded/%.o,$(ALL_SOURCE))
	@rm -f $@
	@ar rs $@ $^




.PHONY: all clean depend

clean:
	find $(NEW_OBJ_DIR) -name *.o -o -name *.a | xargs rm -v

all: $(NEW_OBJ_DIR)/dbg/libogre_semithreaded.a $(NEW_OBJ_DIR)/opt/libogre_semithreaded.a

.DEFAULT_GOAL := all

TEMPFILE:=$(shell tempfile)

depend:
	makedepend -Y $(INCLUDE_DIRS) -f $(TEMPFILE) $(CORE_SOURCE) $(GL_SOURCE) $(PARTICLEFX_SOURCE) $(CG_SOURCE) $(OCTREE_SOURCE) $(POSIX_TIMER_SOURCE) $(CONFIG_GLX_SOURCE) $(GL_GLX_SOURCE) $(OCTREE_GLX_SOURCE) $(GL_WIN32_SOURCE) $(CG_WIN32_SOURCE) $(PARTICLEFX_WIN32_SOURCE) $(OCTREE_WIN32_SOURCE)
	cat $(TEMPFILE) | sed 's/^\([^:]*\): /$(NEW_OBJ_DIR)\/threaded\/&/g' > $(THISFILE).depend
	cat $(TEMPFILE) | sed 's/^\([^:]*\): /$(NEW_OBJ_DIR)\/semithreaded\/&/g' >> $(THISFILE).depend
	cat $(TEMPFILE) | sed 's/^\([^:]*\): /$(NEW_OBJ_DIR)\/unthreaded\/&/g' >> $(THISFILE).depend
	rm $(TEMPFILE)

-include $(THISFILE).depend

# vim: sw=8:ts=8:noet
