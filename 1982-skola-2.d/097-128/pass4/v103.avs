LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v103 = LSMASHVideoSource(dst_dir + "v103rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v103f.mp4")
v103 = ImageSource(file = dst_dir + "v103-png\v103-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v103 = v103.convertToY.adjustSize

#v103 = v103.extractY.convertToYV12(interlaced=false)
#v103 = v103.deScratch.extractY

v103 = v103.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v103 = v103.convertBits(8).convertToYV12(interlaced=false)

v103 = v103.deScratch.extractY
v103 = v103.removeDirt
v103 = v103.convertToYV12(interlaced=false)
v103 = v103.UnsharpMask(strength=400, radius=5, threshold=1)
v103 = v103.adjustBorders
#v103 = v103.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v103 = v103.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v103, audio_rate = 48000, channels = 2).killVideo
v103 = v103.audioDub(va)

return v103.Prefetch

