LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v97 = LSMASHVideoSource(dst_dir + "v97rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v97f.mp4")
v97 = ImageSource(file = dst_dir + "v97-png\v97-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v97 = v97.convertToY.adjustSize

#v97 = v97.extractY.convertToYV12(interlaced=false)
#v97 = v97.deScratch.extractY

v97 = v97.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v97 = v97.convertBits(8).convertToYV12(interlaced=false)

v97 = v97.deScratch.extractY
v97 = v97.removeDirt
v97 = v97.convertToYV12(interlaced=false)
v97 = v97.UnsharpMask(strength=400, radius=5, threshold=1)
v97 = v97.adjustBorders
#v97 = v97.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v97 = v97.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v97, audio_rate = 48000, channels = 2).killVideo
v97 = v97.audioDub(va)

return v97.Prefetch

