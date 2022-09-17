LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v89 = LSMASHVideoSource(dst_dir + "v89rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v89f.mp4")
v89 = ImageSource(file = dst_dir + "v89-png\v89-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v89 = v89.convertToY.adjustSize

#v89 = v89.extractY.convertToYV12(interlaced=false)
#v89 = v89.deScratch.extractY

v89 = v89.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v89 = v89.convertBits(8).convertToYV12(interlaced=false)

v89 = v89.deScratch.extractY
v89 = v89.removeDirt
v89 = v89.convertToYV12(interlaced=false)
v89 = v89.UnsharpMask(strength=400, radius=5, threshold=1)
v89 = v89.adjustBorders
#v89 = v89.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v89 = v89.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v89, audio_rate = 48000, channels = 2).killVideo
v89 = v89.audioDub(va)

return v89.Prefetch

