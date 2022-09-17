LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v65 = LSMASHVideoSource(dst_dir + "v65rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v65f.mp4")
v65 = ImageSource(file = dst_dir + "v65-png\v65-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v65 = v65.convertToY.adjustSize

#v65 = v65.extractY.convertToYV12(interlaced=false)
#v65 = v65.deScratch.extractY

v65 = v65.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v65 = v65.convertBits(8).convertToYV12(interlaced=false)

v65 = v65.deScratch.extractY
v65 = v65.removeDirt
v65 = v65.convertToYV12(interlaced=false)
v65 = v65.UnsharpMask(strength=400, radius=5, threshold=1)
v65 = v65.adjustBorders
#v65 = v65.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v65 = v65.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v65, audio_rate = 48000, channels = 2).killVideo
v65 = v65.audioDub(va)

return v65.Prefetch

