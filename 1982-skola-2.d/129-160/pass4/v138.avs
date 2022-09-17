LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v138 = LSMASHVideoSource(dst_dir + "v138rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v138f.mp4")
v138 = ImageSource(file = dst_dir + "v138-png\v138-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v138 = v138.convertToY.adjustSize

#v138 = v138.extractY.convertToYV12(interlaced=false)
#v138 = v138.deScratch.extractY

v138 = v138.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v138 = v138.convertBits(8).convertToYV12(interlaced=false)

v138 = v138.deScratch.extractY
v138 = v138.removeDirt
v138 = v138.convertToYV12(interlaced=false)
v138 = v138.UnsharpMask(strength=400, radius=5, threshold=1)
v138 = v138.adjustBorders
#v138 = v138.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v138 = v138.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v138, audio_rate = 48000, channels = 2).killVideo
v138 = v138.audioDub(va)

return v138.Prefetch

